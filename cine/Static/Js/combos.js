let combosSeleccionados = {}; // Objeto para almacenar los combos seleccionados

// Función para actualizar el total y la lista de combos seleccionados
function actualizarLista() {
    const lista = document.getElementById("listaCombos");
    lista.innerHTML = ""; // Limpiamos la lista de combos seleccionados

    let totalCombos = 0; // Variable para calcular el total de los combos

    // Recorrer todos los combos seleccionados y agregarlos a la lista
    for (const id in combosSeleccionados) {
        const combo = combosSeleccionados[id];
        if (combo.cantidad > 0) {
            const subtotal = combo.precio * combo.cantidad;
            totalCombos += subtotal;

            // Crear el elemento de la lista
            const li = document.createElement("li");
            li.classList.add("mb-2");
            li.innerHTML = `
                <div class="d-flex justify-content-between align-items-center">
                    <div>
                        <strong>${combo.nombre}</strong><br>
                        <small>$${combo.precio} x ${combo.cantidad} = $${subtotal.toFixed(2)}</small>
                    </div>
                    <div>
                        <button class="btn btn-sm btn-outline-secondary me-2" onclick="modificarCantidad('${id}', -1)">-</button>
                        <span>${combo.cantidad}</span>
                        <button class="btn btn-sm btn-outline-secondary ms-2" onclick="modificarCantidad('${id}', 1)">+</button>
                    </div>
                </div>
            `;
            lista.appendChild(li); // Agregar el combo a la lista
        }
    }

    // Actualizamos el total, teniendo en cuenta el total de los combos
    actualizarTotal();
}

// Función para modificar la cantidad de un combo
function modificarCantidad(id, cambio) {
    if (!combosSeleccionados[id]) return;

    combosSeleccionados[id].cantidad += cambio;

    // Si la cantidad es menor o igual a 0, eliminamos el combo de la lista
    if (combosSeleccionados[id].cantidad <= 0) {
        delete combosSeleccionados[id];
    }

    actualizarLista(); // Actualizamos la lista de combos
}

// Obtener el precio de los asientos desde el DOM y calcular el total inicial
window.addEventListener("DOMContentLoaded", function () {
    // Obtener el precio de los asientos
    const precioAsiento = parseFloat(document.getElementById("precio").innerText);
    const asientosTexto = document.getElementById("asientosSeleccionados").innerText;

    let totalAsientos = 0;
    if (asientosTexto.trim() !== "Ninguno") {
        const asientosArray = asientosTexto.split(',').map(a => a.trim());
        totalAsientos = asientosArray.length * precioAsiento;
    }

    // Inicializamos el total con el precio de los asientos
    let totalFinal = totalAsientos;

    // Actualizamos el total en el DOM
    document.getElementById("total").innerText = totalFinal.toFixed(2);
});

// Añadir evento a los botones "Añadir"
document.addEventListener("DOMContentLoaded", function () {
    document.querySelectorAll(".btn-anadir").forEach(function (btn) {
        btn.addEventListener("click", function () {
            const id = btn.dataset.id;
            const nombre = btn.dataset.nombre;
            const precio = parseFloat(btn.dataset.precio);

            // Si el combo no está en el objeto combosSeleccionados, lo agregamos
            if (!combosSeleccionados[id]) {
                combosSeleccionados[id] = { nombre, cantidad: 1, precio };
            } else {
                combosSeleccionados[id].cantidad++; // Si ya está, incrementamos la cantidad
            }

            actualizarLista(); // Actualizamos la lista de combos seleccionados
        });
    });
});

// Función para actualizar el total general
function actualizarTotal() {
    let totalCombos = 0;

    // Sumar todos los totales de los combos
    for (const id in combosSeleccionados) {
        const combo = combosSeleccionados[id];
        if (combo.cantidad > 0) {
            totalCombos += combo.precio * combo.cantidad;
        }
    }

    // Obtener el total de los asientos
    const precioAsiento = parseFloat(document.getElementById("precio").innerText);
    const asientosTexto = document.getElementById("asientosSeleccionados").innerText;

    let totalAsientos = 0;
    if (asientosTexto.trim() !== "Ninguno") {
        const asientosArray = asientosTexto.split(',').map(a => a.trim());
        totalAsientos = asientosArray.length * precioAsiento;
    }

    // Calcular el total final
    const totalFinal = totalCombos + totalAsientos;

    // Actualizar el total en el DOM
    document.getElementById("total").innerText = totalFinal.toFixed(2);
}
