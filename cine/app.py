import mysql.connector
from flask import Flask, render_template, request, redirect, url_for, session, flash, jsonify
from werkzeug.security import generate_password_hash, check_password_hash
import os
from werkzeug.utils import secure_filename
from datetime import datetime

app = Flask(__name__)
app.secret_key = 'tu_clave_secreta'

db_config = {
    'host': 'localhost',
    'user': 'root',
    'password': '',  
    'database': 'Cine',
    'port': 3308
}


def get_db_connection():
    return mysql.connector.connect(**db_config)

@app.route('/')
def index():
    db = get_db_connection()
    cursor = db.cursor(dictionary=True)

    # Asegurarse de seleccionar 'id_pelicula' en la consulta SQL
    cursor.execute("SELECT id_pelicula, genero, titulo, duracion, imagen_cartelera FROM peliculas WHERE estado = 'Cartelera' ORDER BY genero")
    peliculas = cursor.fetchall()

    cursor.close()
    db.close()

    peliculas_por_genero = {}
    for pelicula in peliculas:
        genero = pelicula['genero']
        if genero not in peliculas_por_genero:
            peliculas_por_genero[genero] = []
        peliculas_por_genero[genero].append(pelicula)    

    return render_template('index.html', peliculas_por_genero=peliculas_por_genero)



@app.route('/login', methods=['GET', 'POST'])
def login():
    if 'user_id' in session:  
        return redirect(url_for('index'))  # Si ya está logueado, lo manda a la página principal

    if request.method == 'POST':
        email = request.form['email']
        password = request.form['password']
        
        conn = get_db_connection()
        cur = conn.cursor(dictionary=True)
        cur.execute("SELECT id, password, rol FROM users WHERE email = %s", (email,))
        user = cur.fetchone()
        cur.close()
        conn.close()

        if user and check_password_hash(user["password"], password):  
            session['user_id'] = user["id"]
            session['rol'] = user["rol"]  
            flash("Inicio de sesión exitoso", "success")

            if user["rol"] == "administrativo":
                return redirect(url_for('listar_peliculas'))  # Redirigir si es administrativo
            else:
                return redirect(url_for('index'))  # Redirigir a la página principal

        else:
            flash("Correo o contraseña incorrectos", "error")
    
    return render_template('login.html')




@app.route('/register', methods=['GET', 'POST'])
def register():
    if request.method == 'POST':
        nombre = request.form['nombre']
        email = request.form['email']
        direccion = request.form['direccion']
        tipo_id = request.form['tipo_id']
        numero_id = request.form['numero_id']
        telefono = request.form['telefono']
        password = generate_password_hash(request.form['password'])

        try:
            conn = get_db_connection()
            cur = conn.cursor()
            cur.execute("""
                INSERT INTO users (nombre, email, direccion, tipo_id, numero_id, telefono, password) 
                VALUES (%s, %s, %s, %s, %s, %s, %s)
            """, (nombre, email, direccion, tipo_id, numero_id, telefono, password))

            conn.commit()
            cur.close()
            conn.close()
            flash("Registro exitoso. Ahora puedes iniciar sesión.", "success")
            return redirect(url_for('login'))
        except Exception as e:
            print("Error al registrar:", str(e))
            flash("Error al registrar. Intenta nuevamente.", "error")

    return render_template('register.html')

@app.route('/forgot-password', methods=['GET', 'POST'])
def forgot_password():
    if request.method == 'POST':
        email = request.form['email']
        flash("Si el correo existe, recibirás un enlace para restablecer la contraseña.", "info")

    
    return render_template('forgot_password.html')

@app.route('/profile')
def profile():
    if 'user_id' not in session:
        return redirect(url_for('login'))

    users_id = session['user_id']

    # Conectar a la base de datos
    db = get_db_connection()
    cursor = db.cursor(dictionary=True)

    # Obtener información del usuario
    cursor.execute("SELECT id, nombre, direccion, tipo_id, numero_id, telefono, email, rol FROM users WHERE id = %s", (users_id,))
    users = cursor.fetchone()

    cursor.close()
    db.close()

    if not users:
        return redirect(url_for('logout'))  
    session['username'] = users['nombre']
    session['email'] = users['email']
    session['direccion'] = users['direccion']
    session['tipo_id'] = users['tipo_id']
    session['numero_id'] = users['numero_id']
    session['telefono'] = users['telefono']
    session['rol'] = users.get('rol', 'Usuario')  

    return render_template('profile.html', users=users)



@app.route('/peliculas')
def listar_peliculas():
    db = get_db_connection()
    cursor = db.cursor(dictionary=True)
    cursor.execute("SELECT * FROM peliculas")
    peliculas = cursor.fetchall()
    cursor.close()
    db.close()
    return render_template('gestionar_peliculas.html', peliculas=peliculas)

UPLOAD_FOLDER = 'static/uploads'
app.config['UPLOAD_FOLDER'] = UPLOAD_FOLDER

if not os.path.exists(UPLOAD_FOLDER):
    os.makedirs(UPLOAD_FOLDER)

@app.route('/crear_pelicula', methods=['GET', 'POST'])
def crear_pelicula():
    if request.method == 'POST':
        titulo = request.form['titulo']
        duracion = request.form['duracion']
        genero = request.form['genero']
        clasificacion = request.form['clasificacion']
        sinopsis = request.form['sinopsis']
        director = request.form['director']
        reparto = request.form['reparto']
        idioma = request.form['idioma']
        estado = request.form['estado']
        video_pelicula = request.form['video_pelicula']  

        imagen_cartelera = request.files.get('imagen_cartelera')
        if imagen_cartelera and imagen_cartelera.filename:
            imagen_nombre = secure_filename(imagen_cartelera.filename)
            imagen_ruta = os.path.join(app.config['UPLOAD_FOLDER'], imagen_nombre)
            imagen_cartelera.save(imagen_ruta)
        else:
            imagen_ruta = "static/uploads/default.jpg"  
        db = get_db_connection()
        cursor = db.cursor()
        cursor.execute(
            "INSERT INTO peliculas (titulo, duracion, genero, clasificacion, sinopsis, director, reparto, idioma, estado, imagen_cartelera, video_pelicula) "
            "VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)",
            (titulo, duracion, genero, clasificacion, sinopsis, director, reparto, idioma, estado, imagen_ruta, video_pelicula)
        )

        db.commit()
        cursor.close()
        db.close()
        return redirect(url_for('listar_peliculas'))

    return render_template('crear_pelicula.html')


@app.route('/editar_pelicula/<int:id_pelicula>', methods=['GET', 'POST'])
def editar_pelicula(id_pelicula):
    db = get_db_connection()
    cursor = db.cursor(dictionary=True)
    
    try:

        cursor.execute("SELECT * FROM peliculas WHERE id_pelicula = %s", (id_pelicula,))
        pelicula = cursor.fetchone()

        if not pelicula:
            return "Error: Película no encontrada", 404

        if request.method == 'POST':

            titulo = request.form.get('titulo', pelicula['titulo']).strip()
            duracion = request.form.get('duracion', pelicula['duracion']).strip()
            genero = request.form.get('genero', pelicula['genero']).strip()
            clasificacion = request.form.get('clasificacion', pelicula['clasificacion']).strip()
            sinopsis = request.form.get('sinopsis', pelicula['sinopsis']).strip()
            director = request.form.get('director', pelicula['director']).strip()
            reparto = request.form.get('reparto', pelicula['reparto']).strip()
            idioma = request.form.get('idioma', pelicula['idioma']).strip()
            estado = request.form.get('estado', pelicula['estado']).strip()
            video_pelicula = request.form.get('video_pelicula', pelicula['video_pelicula']).strip()
            imagen_cartelera = request.files.get('imagen_cartelera')
            if imagen_cartelera and imagen_cartelera.filename:
                imagen_nombre = secure_filename(imagen_cartelera.filename)
                imagen_ruta = os.path.join(app.config['UPLOAD_FOLDER'], imagen_nombre)
                imagen_cartelera.save(imagen_ruta)
            else:
                imagen_ruta = pelicula['imagen_cartelera'] 

            cursor.execute(
                """UPDATE peliculas SET titulo=%s, duracion=%s, genero=%s, clasificacion=%s, sinopsis=%s, 
                director=%s, reparto=%s, idioma=%s, estado=%s, imagen_cartelera=%s, video_pelicula=%s 
                WHERE id_pelicula=%s""",
                (titulo, duracion, genero, clasificacion, sinopsis, director, reparto, idioma, estado, imagen_ruta, video_pelicula, id_pelicula)
            )
            db.commit()

            return redirect(url_for('listar_peliculas'))
    
    except mysql.connector.errors.DatabaseError as e:
        db.rollback() 
        print(f"Error en la base de datos: {e}")
        return "Error al actualizar la película", 500
    
    finally:
        cursor.close()
        db.close()
    
    return render_template('editar_pelicula.html', pelicula=pelicula)





@app.route('/eliminar_pelicula/<int:id_pelicula>')
def eliminar_pelicula(id_pelicula):
    db = get_db_connection()
    cursor = db.cursor()
    cursor.execute("DELETE FROM peliculas WHERE id_pelicula = %s", (id_pelicula,))
    db.commit()
    cursor.close()
    db.close()
    return redirect(url_for('listar_peliculas'))

@app.route('/admin')
def admin():

    return render_template('admin.html')

@app.route('/gestionar_salas', methods=['GET'])
def gestionar_salas():
    db = get_db_connection()
    cursor = db.cursor()
    
    cursor.execute("SELECT id_sala, nombre, capacidad, tipo FROM salas")
    salas = cursor.fetchall()
    
    cursor.close()
    db.close()
    
    return render_template('gestionar_salas.html', salas=salas)


@app.route('/crear_sala', methods=['GET', 'POST'])
def crear_sala():
    if request.method == 'GET':
        return render_template('crear_salas.html')

    db = get_db_connection()
    cursor = db.cursor()


    nombre = request.form.get('nombre', '').strip()
    capacidad = request.form.get('capacidad', '').strip()
    tipo = request.form.get('tipo', '').strip()


    if not nombre or not capacidad or not tipo:
        return "Error: Faltan datos en el formulario", 400

    try:
        capacidad = int(capacidad)
    except ValueError:
        return "Error: Capacidad debe ser un número válido", 400


    cursor.execute("INSERT INTO salas (nombre, capacidad, tipo) VALUES (%s, %s, %s)", (nombre, capacidad, tipo))
    db.commit()
    id_sala = cursor.lastrowid  


    filas = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
    num_filas = min(len(filas), max(1, capacidad // 15))  
    num_asientos_por_fila = max(1, capacidad // num_filas)  

    for i in range(num_filas):
        for j in range(1, num_asientos_por_fila + 1):
            cursor.execute("INSERT INTO asientos (id_sala, fila, numero) VALUES (%s, %s, %s)", (id_sala, filas[i], j))

    db.commit()
    cursor.close()
    db.close()

    return redirect(url_for('gestionar_salas'))  




@app.route('/editar_sala/<int:id_sala>', methods=['GET', 'POST'])
def editar_sala(id_sala):
    db = get_db_connection()
    cursor = db.cursor(dictionary=True)

    if request.method == 'POST':
        nombre = request.form['nombre']
        capacidad = request.form['capacidad']
        tipo = request.form['tipo']

        query = "UPDATE salas SET nombre = %s, capacidad = %s, tipo = %s WHERE id_sala = %s"
        cursor.execute(query, (nombre, capacidad, tipo, id_sala))
        db.commit()

        cursor.close()
        db.close()

        flash('Sala actualizada correctamente.', 'success')
        return redirect(url_for('gestionar_salas'))

    cursor.execute("SELECT id_sala, nombre, capacidad, tipo FROM salas WHERE id_sala = %s", (id_sala,))
    sala = cursor.fetchone()

    cursor.close()
    db.close()

    return render_template('editar_salas.html', sala=sala)


@app.route('/eliminar_sala/<int:id_sala>', methods=['GET'])
def eliminar_sala(id_sala):
    db = get_db_connection()
    cursor = db.cursor()

    query = "DELETE FROM salas WHERE id_sala = %s"
    cursor.execute(query, (id_sala,))
    db.commit()

    cursor.close()
    db.close()

    flash('Sala eliminada correctamente.', 'success')
    return redirect(url_for('gestionar_salas'))

@app.route('/crear_funcion', methods=['GET', 'POST'])
def crear_funcion():
    db = get_db_connection()
    cursor = db.cursor()

    if request.method == 'POST':
        pelicula_id = request.form['pelicula']
        sala_id = request.form['sala']
        horario = request.form['horario']
        precio = request.form['precio']

        cursor.execute(
            "INSERT INTO funciones (id_pelicula, id_sala, horario, precio) VALUES (%s, %s, %s, %s)",
            (pelicula_id, sala_id, horario, precio)
        )
        db.commit()

        cursor.close()
        db.close()
        return redirect(url_for('gestionar_funciones'))


    cursor.execute("SELECT id_pelicula, titulo FROM peliculas")
    peliculas = cursor.fetchall()

    cursor.execute("SELECT id_sala, nombre FROM salas")
    salas = cursor.fetchall()

    cursor.close()
    db.close()

    return render_template('crear_funciones.html', peliculas=peliculas, salas=salas)

@app.route('/gestionar_funciones')
def gestionar_funciones():
    db = get_db_connection()
    cursor = db.cursor(dictionary=True)  


    cursor.execute("""
        SELECT funciones.id_funcion, peliculas.titulo AS nombre_pelicula, salas.nombre AS nombre_sala, funciones.horario, funciones.precio
        FROM funciones
        JOIN peliculas ON funciones.id_pelicula = peliculas.id_pelicula
        JOIN salas ON funciones.id_sala = salas.id_sala
    """)
    funciones = cursor.fetchall()

    cursor.close()
    db.close()

    return render_template('gestionar_funciones.html', funciones=funciones)

@app.route('/eliminar_funcion/<int:id_funcion>', methods=['GET'])
def eliminar_funcion(id_funcion):
    db = get_db_connection()
    cursor = db.cursor()

    cursor.execute("DELETE FROM funciones WHERE id_funcion = %s", (id_funcion,))
    db.commit()

    cursor.close()
    db.close()
    return redirect(url_for('gestionar_funciones'))


@app.route('/editar_funcion/<int:id_funcion>', methods=['GET', 'POST'])
def editar_funcion(id_funcion):
    db = get_db_connection()
    cursor = db.cursor(dictionary=True)


    cursor.execute("SELECT * FROM funciones WHERE id_funcion = %s", (id_funcion,))
    funcion = cursor.fetchone()

    if not funcion:
        cursor.close()
        db.close()
        return "Error: Función no encontrada", 404


    print(funcion) 

    if request.method == 'POST':

        pelicula_id = request.form['pelicula']
        sala_id = request.form['sala']
        horario = request.form['horario']
        precio = request.form['precio']


        cursor.execute(
            "UPDATE funciones SET id_pelicula = %s, id_sala = %s, horario = %s, precio = %s WHERE id_funcion = %s",
            (pelicula_id, sala_id, horario, precio, id_funcion)
        )
        db.commit()

        cursor.close()
        db.close()
        return redirect(url_for('gestionar_funciones'))


    cursor.execute("SELECT id_pelicula, titulo FROM peliculas")
    peliculas = cursor.fetchall()

    cursor.execute("SELECT id_sala, nombre FROM salas")
    salas = cursor.fetchall()

    cursor.close()
    db.close()

    return render_template('editar_funcion.html', funcion=funcion, peliculas=peliculas, salas=salas)



# Configurar carpeta de subida
app.config['UPLOAD_FOLDER'] = os.path.join(app.root_path, 'static', 'uploads')

# Asegurar que la carpeta existe
if not os.path.exists(app.config['UPLOAD_FOLDER']):
    os.makedirs(app.config['UPLOAD_FOLDER'])

@app.route('/crear_producto', methods=['GET', 'POST'])
def crear_producto():
    if request.method == 'POST':
        nombre = request.form['nombre']
        descripcion = request.form['descripcion']
        precio = request.form['precio']
        stock = request.form['stock']

        # Manejo de imagen
        imagen_confiteria = request.files.get('imagen_confiteria')
        if imagen_confiteria and imagen_confiteria.filename:
            imagen_nombre = secure_filename(imagen_confiteria.filename)
            imagen_ruta_absoluta = os.path.join(app.config['UPLOAD_FOLDER'], imagen_nombre)
            imagen_confiteria.save(imagen_ruta_absoluta)
            imagen_ruta = f"uploads/{imagen_nombre}"  # Guardar solo la ruta relativa
        else:
            imagen_ruta = "uploads/default_product_image.jpg"  # Imagen por defecto

        # Conectar a la base de datos
        db = get_db_connection()
        cursor = db.cursor()
        cursor.execute(
            "INSERT INTO confiteria (nombre, descripcion, precio, stock, imagen_confiteria) "
            "VALUES (%s, %s, %s, %s, %s)",
            (nombre, descripcion, precio, stock, imagen_ruta)
        )

        db.commit()
        cursor.close()
        db.close()
        return redirect(url_for('gestionar_confiteria'))

    return render_template('crear_producto.html')





@app.route('/gestionar')
def gestionar_confiteria():
    db = get_db_connection()
    cursor = db.cursor(dictionary=True)  

    cursor.execute("""
        SELECT id_producto, nombre, descripcion, precio, stock, imagen_confiteria
        FROM confiteria
    """)
    productos = cursor.fetchall()

    cursor.close()
    db.close()
    return render_template('gestionar_confiteria.html', productos=productos)



@app.route('/eliminar_producto/<int:id_producto>', methods=['GET'])
def eliminar_producto(id_producto):
    db = get_db_connection()
    cursor = db.cursor()

    cursor.execute("DELETE FROM confiteria WHERE id_producto = %s", (id_producto,))
    db.commit()

    cursor.close()
    db.close()
    return redirect(url_for('gestionar_confiteria'))


@app.route('/editar_producto/<int:id_producto>', methods=['GET', 'POST'])
def editar_producto(id_producto):
    db = get_db_connection()
    cursor = db.cursor(dictionary=True)

    cursor.execute("SELECT * FROM confiteria WHERE id_producto = %s", (id_producto,))
    producto = cursor.fetchone()

    if not producto:
        cursor.close()
        db.close()
        return "Error: Producto no encontrado", 404

    if request.method == 'POST':
        nombre = request.form['nombre']
        descripcion = request.form['descripcion']
        precio = request.form['precio']
        stock = request.form['stock']

        cursor.execute(
            "UPDATE confiteria SET nombre = %s, descripcion = %s, precio = %s, stock = %s WHERE id_producto = %s",
            (nombre, descripcion, precio, stock, id_producto)
        )
        db.commit()

        cursor.close()
        db.close()
        return redirect(url_for('gestionar_confiteria'))

    cursor.close()
    db.close()

    return render_template('editar_producto.html', producto=producto)



@app.route('/billboard')
def billboard():
    db = get_db_connection()
    cursor = db.cursor(dictionary=True)

    # Selecciona películas que estén en "Cartelera" o "Proximamente"
    cursor.execute("""
        SELECT id_pelicula, estado, titulo, genero, clasificacion, duracion, imagen_cartelera 
        FROM peliculas 
        WHERE estado IN ('Cartelera', 'Proximamente') 
        ORDER BY estado
    """)
    peliculas = cursor.fetchall()

    cursor.close()
    db.close()

    # Organizar películas por estado en un diccionario
    peliculas_por_estado = {}
    for pelicula in peliculas:
        estado = pelicula['estado']
        if estado not in peliculas_por_estado:
            peliculas_por_estado[estado] = []
        peliculas_por_estado[estado].append(pelicula)

    return render_template('billboard.html', peliculas_por_estado=peliculas_por_estado)







@app.route('/pelicula/<int:id_pelicula>')
def detalle_pelicula(id_pelicula):
    db = get_db_connection()
    cursor = db.cursor(dictionary=True)

    # Obtener la información de la película
    cursor.execute("""
        SELECT * FROM peliculas WHERE id_pelicula = %s
    """, (id_pelicula,))
    pelicula = cursor.fetchone()

    if not pelicula:
        cursor.close()
        db.close()
        return "Película no encontrada", 404

    # Obtener las funciones disponibles de la película
    cursor.execute("""
        SELECT f.id_funcion, f.horario, f.precio, s.id_sala
        FROM funciones f
        JOIN salas s ON f.id_sala = s.id_sala
        WHERE f.id_pelicula = %s
        ORDER BY f.horario
    """, (id_pelicula,))

    funciones = cursor.fetchall()

    cursor.close()
    db.close()

    # Organizar funciones por fecha, filtrando solo las futuras o actuales
    funciones_disponibles = {}
    hoy = datetime.now().date()

    for funcion in funciones:
        fecha = funcion["horario"].date()  # Obtener la fecha
        if fecha >= hoy:  # Filtrar funciones pasadas
            hora = funcion["horario"].strftime("%H:%M")  # Extraer solo la hora
            fecha_str = fecha.strftime("%Y-%m-%d")  # Convertir fecha a string

            if fecha_str not in funciones_disponibles:
                funciones_disponibles[fecha_str] = []
            
            funciones_disponibles[fecha_str].append({
                "id_funcion": funcion["id_funcion"],  # 🔹 Agregamos el ID de la función
                "hora": hora,
                "sala": funcion["id_sala"],
                "precio": funcion["precio"]
            })


    return render_template('detalle_pelicula.html', pelicula=pelicula, funciones_disponibles=funciones_disponibles)



@app.route("/seleccionar-asientos/<int:id_funcion>", methods=["GET", "POST"])
def seleccionar_asientos(id_funcion):
    if "user_id" not in session:
        flash("Debes iniciar sesión para seleccionar asientos.", "warning")
        return redirect(url_for("login", next=request.url))

    conn = get_db_connection()
    cursor = conn.cursor(dictionary=True)

    cursor.execute("""
        SELECT f.id_funcion, f.horario, p.titulo, p.duracion, p.genero, f.precio,
               p.clasificacion, p.director, p.idioma, f.id_sala, p.imagen_cartelera
        FROM funciones f
        JOIN peliculas p ON f.id_pelicula = p.id_pelicula
        WHERE f.id_funcion = %s
    """, (id_funcion,))
    funcion = cursor.fetchone()

    if not funcion:
        cursor.close()
        conn.close()
        flash("Función no encontrada.", "danger")
        return redirect(url_for("index"))

    # Crear una variable independiente para la película
    pelicula = {
        "titulo": funcion["titulo"],
        "duracion": funcion["duracion"],
        "genero": funcion["genero"],
        "clasificacion": funcion["clasificacion"],
        "director": funcion["director"],
        "idioma": funcion["idioma"],
        "imagen_cartelera": funcion["imagen_cartelera"]
    }

    cursor.execute("SELECT * FROM salas WHERE id_sala = %s", (funcion["id_sala"],))
    sala = cursor.fetchone()

    cursor.execute("SELECT id_asiento FROM boletos WHERE id_funcion = %s", (id_funcion,))
    ocupados = [row["id_asiento"] for row in cursor.fetchall()]

    cursor.execute("SELECT * FROM asientos WHERE id_sala = %s ORDER BY fila, numero", (sala["id_sala"],))
    asientos = cursor.fetchall()

    cursor.close()
    conn.close()

    # Agrupar asientos por fila
    filas_ordenadas = {}
    for asiento in asientos:
        fila_letra = asiento["fila"]  # Usar la letra directamente
        if fila_letra not in filas_ordenadas:
            filas_ordenadas[fila_letra] = []
        filas_ordenadas[fila_letra].append(asiento)

    if request.method == "POST":
        # Aquí se deberían seleccionar los asientos, por ejemplo desde un formulario
        asientos_seleccionados = request.form.getlist("asientos")  # Suponiendo que los asientos son pasados desde un formulario
        total_asientos = len(asientos_seleccionados) * funcion["precio"]

        # Guardar en la sesión los asientos seleccionados y el total
        session['asientos_seleccionados'] = asientos_seleccionados
        session['total_asientos'] = total_asientos

        return redirect(url_for('seleccionar_combos', funcion_id=id_funcion))

    return render_template(
        "seleccionar_asientos.html",
        funcion=funcion,
        pelicula=pelicula,  # Ahora pasamos la variable película
        sala=sala,
        ocupados=ocupados,
        filas_ordenadas=filas_ordenadas
    )


@app.route("/reservar-asientos", methods=["POST"])
def reservar_asientos():
    data = request.get_json()

    if not data:
        return jsonify({"error": "Datos no recibidos"}), 400

    funcion_id = data.get("funcion_id")
    asientos = data.get("asientos", [])  # ["A1", "A2"]

    if not funcion_id or not asientos:
        return jsonify({"error": "Información incompleta"}), 400

    # Guardamos en sesión
    session["asientos_seleccionados"] = asientos
    session["total_asientos"] = len(asientos) * obtener_precio_funcion(funcion_id)

    return jsonify({"success": True})

def obtener_precio_funcion(funcion_id):
    conn = get_db_connection()
    cursor = conn.cursor()
    cursor.execute("SELECT precio FROM funciones WHERE id_funcion = %s", (funcion_id,))
    row = cursor.fetchone()
    cursor.close()
    conn.close()
    return row[0] if row else 0


@app.route("/seleccionar-combos")
def seleccionar_combos():
    funcion_id = request.args.get("funcion_id")
    if not funcion_id:
        return redirect(url_for("home"))  # Redirigir si no se pasa el funcion_id

    # Recuperar la función completa (como en seleccionar_asientos) para poder pasarla a la plantilla
    conn = get_db_connection()
    cursor = conn.cursor(dictionary=True)

    cursor.execute("""
        SELECT f.id_funcion, f.horario, p.titulo, p.duracion, p.genero, f.precio,
               p.clasificacion, p.director, p.idioma, f.id_sala, p.imagen_cartelera
        FROM funciones f
        JOIN peliculas p ON f.id_pelicula = p.id_pelicula
        WHERE f.id_funcion = %s
    """, (funcion_id,))
    funcion = cursor.fetchone()

    if not funcion:
        cursor.close()
        conn.close()
        flash("Función no encontrada.", "danger")
        return redirect(url_for("index"))

    # Cargar los combos desde la base de datos
    cursor.execute("SELECT * FROM confiteria")
    confiteria = cursor.fetchall()

    # Recuperar los asientos seleccionados y el valor total desde la sesión
    asientos_seleccionados = session.get('asientos_seleccionados', [])
    total_asientos = session.get('total_asientos', 0)

    cursor.close()
    conn.close()

    return render_template(
        "seleccionar_combos.html", 
        confiteria=confiteria, 
        asientos_seleccionados=asientos_seleccionados, 
        total_asientos=total_asientos,
        funcion=funcion  # Pasar la variable funcion a la plantilla
    )








@app.route("/pago/<int:funcion_id>")
def pago(funcion_id):
    # Aquí iría la lógica para la vista de pago
    # Puedes usar el funcion_id para recuperar la información de la función y procesar el pago
    return render_template("pago.html", funcion_id=funcion_id)



@app.route('/confectionery')
def confectionery():
    # Establecer la conexión a la base de datos
    db = get_db_connection()
    cursor = db.cursor(dictionary=True)

    # Consultar todos los productos de la tabla confiteria
    cursor.execute("""
        SELECT id_producto, nombre, descripcion, precio, stock, imagen_confiteria
        FROM confiteria
    """)
    productos = cursor.fetchall()

    # Cerrar la conexión
    cursor.close()
    db.close()

    # Renderizar la plantilla con los datos de los productos
    return render_template('confectionery.html', productos=productos)


@app.route('/promociones')
def promociones():
    return render_template('promociones.html')



@app.route('/logout')
def logout():
    session.clear()
    flash("Has cerrado sesión correctamente", "success")
    return redirect(url_for('login'))

if __name__ == '__main__':
    app.run(debug=True)
