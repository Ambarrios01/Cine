document.addEventListener("DOMContentLoaded", function () {
    const asientos = document.querySelectorAll(".asiento.disponible");
    const botonReservar = document.getElementById("reservar");
    const precioFuncion = parseFloat(document.getElementById("precioFuncion").innerText); 
    const asientosContainer = document.getElementById("asientosSeleccionados"); 
    const funcionId = document.getElementById("funcionId").value;
    let seleccionados = [];

    asientos.forEach(asiento => {
        asiento.addEventListener("click", function () {
            const fila = this.getAttribute("data-fila");
            const numero = this.getAttribute("data-numero");
            const asientoIdentificador = `${fila}${numero}`;

            if (seleccionados.includes(asientoIdentificador)) {
                seleccionados = seleccionados.filter(asiento => asiento !== asientoIdentificador);
                this.classList.remove("seleccionado");
            } else {
                seleccionados.push(asientoIdentificador);
                this.classList.add("seleccionado");
            }

            actualizarListaAsientos();
            actualizarTotal();
        });
    });

    function actualizarListaAsientos() {
        asientosContainer.textContent = seleccionados.length > 0 
            ? seleccionados.join(", ")
            : "Ninguno";
    }

    function actualizarTotal() {
        const total = precioFuncion * seleccionados.length;
        document.getElementById("total").innerText = total.toFixed(2);
    }

    botonReservar.addEventListener("click", function (e) {
        e.preventDefault(); // ✨ Evita que el <a> redireccione por sí solo

        if (seleccionados.length === 0) {
            alert("Selecciona al menos un asiento.");
            return;
        }

        fetch("/reservar-asientos", {
            method: "POST",
            headers: {
                "Content-Type": "application/json"
            },
            body: JSON.stringify({
                funcion_id: funcionId,
                asientos: seleccionados
            })
        })
        .then(response => response.json())
        .then(data => {
            if (data.error) {
                alert(data.error);
            } else {
                // Redirigir al combo
                window.location.href = `/seleccionar-combos?funcion_id=${funcionId}`;
            }
        })
        .catch(error => console.error("Error:", error));
    });
});
