document.addEventListener("DOMContentLoaded", function () {
    let hoy = new Date().toISOString().split("T")[0]; // Obtener la fecha actual en formato YYYY-MM-DD
    mostrarFunciones(hoy); // Mostrar las funciones del día actual
});

function mostrarFunciones(fecha) {
    // Ocultar todas las funciones
    document.querySelectorAll(".fecha").forEach(el => el.style.display = "none");

    // Mostrar solo las funciones del día seleccionado
    let funcionesDelDia = document.getElementById("funciones-" + fecha);
    if (funcionesDelDia) {
        funcionesDelDia.style.display = "block";
    }

    // Resaltar el botón activo
    document.querySelectorAll(".fecha-btn").forEach(btn => btn.classList.remove("activo"));
    let botonActivo = document.getElementById("btn-" + fecha);
    if (botonActivo) {
        botonActivo.classList.add("activo");
    }
}