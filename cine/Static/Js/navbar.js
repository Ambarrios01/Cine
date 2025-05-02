function toggleMenu() {
    const menu = document.querySelector(".nav-links");
    const overlay = document.querySelector(".overlay");

    menu.classList.toggle("show");
    overlay.classList.toggle("show");
}

document.addEventListener("click", function (event) {
    const menu = document.querySelector(".nav-links");
    const menuToggle = document.querySelector(".menu-toggle");

    if (!menu.contains(event.target) && !menuToggle.contains(event.target)) {
        menu.classList.remove("show");
        document.querySelector(".overlay").classList.remove("show");
    }
});




document.addEventListener("DOMContentLoaded", function () {
    const userIcon = document.querySelector(".user-icon");
    const dropdown = document.querySelector(".dropdown");

    userIcon.addEventListener("click", function (event) {
        event.preventDefault();
        dropdown.style.display = dropdown.style.display === "block" ? "none" : "block";
    });


    document.addEventListener("click", function (event) {
        if (!userIcon.contains(event.target) && !dropdown.contains(event.target)) {
            dropdown.style.display = "none";
        }
    });
});
