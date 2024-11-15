window.onload = function () {
    let currentSlide = 0;
    const slides = document.querySelectorAll('.slider-item');
    const totalSlides = slides.length;
    const paginationButtons = document.querySelectorAll('.pagination button');

    function updateSlide() {
        const newTransformValue = -currentSlide * 100;
        document.querySelector('.slider-container').style.transform = 'translateX(' + newTransformValue + '%)';
        paginationButtons.forEach((button, index) => {
            button.classList.toggle('active', index === currentSlide);
        });
    }

    function goToSlide(slideIndex) {
        currentSlide = slideIndex;
        updateSlide();
    }

    function nextSlide() {
        currentSlide = (currentSlide + 1) % totalSlides;
        updateSlide();
    }

    setInterval(nextSlide, 3000);
    updateSlide();
};


/**
 * Menu isotope and filter
 */
window.addEventListener('load', () => {
    let menuContainer = select('.menu-containerF');
    if (menuContainer) {
        let menuIsotope = new Isotope(menuContainer, {
            itemSelector: '.menu-itemF',
            layoutMode: 'fitRows'
        });

        let menuFilters = select('#menu-fltersF li', true);

        on('click', '#menu-fltersF li', function (e) {
            e.preventDefault();
            menuFilters.forEach(function (el) {
                el.classList.remove('filter-active');
            });
            this.classList.add('filter-active');

            menuIsotope.arrange({
                filter: this.getAttribute('data-filter')
            });
            menuIsotope.on('arrangeComplete', function () {
                AOS.refresh()
            });
        }, true);
    }

});