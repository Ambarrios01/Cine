document.addEventListener("DOMContentLoaded", function () {
    const backgrounds = [
        "/Static/Img/450_1000 (1).jpg",
        "/Static/Img/450_1000.jpg",
        "/Static/Img/Flore-Maquin-movie-posters-illustration-django-.webp",
        "/Static/Img/image_51013278.jpeg"
    ];

    let currentIndex = 0;
    const bgSlider = document.querySelector(".background-slider");

    function changeBackground() {
        bgSlider.style.backgroundImage = `url('${backgrounds[currentIndex]}')`;
        currentIndex = (currentIndex + 1) % backgrounds.length;
    }


    changeBackground(); 
    setInterval(changeBackground, 5000);
});
