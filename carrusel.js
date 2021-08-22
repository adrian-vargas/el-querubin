document.addEventListener('DOMContentLoaded', () => {
	const elementosCarousel = document.querySelectorAll('.carousel');
	M.Carousel.init(elementosCarousel, {
		duration: 150,
		dist: -80,
		shift: 5,
		padding: 5,
		numVisible: 5,
		indicators: false

	});	
});


$(document).ready(function(){
 	  var carousel_interval = 4500;
      $('.carousel').carousel();
      
      setInterval(function(){
     		$('.carousel').carousel('next');
      }, carousel_interval);

      var idSelect = "";

      //Le agregamos un evento clic a la clase .carousel-item, que es aquella
      //Que tienen los elementos de tu carrusel
		$('.carousel-item').on('click', function () {
			idSelect =   this.id;
			localStorage['seleccion'] = idSelect;
			localStorage['mostrar'] = "si";
		});
});

$('.carousel.carousel-slider').carousel({fullWidth: true,indicators: true});
var autoplay = true;
setInterval(function() { if(autoplay) $('.carousel.carousel-slider').carousel('next'); }, 4500);
$('.carousel.carousel-slider').hover(function(){ autoplay = false; },function(){ autoplay = true; });

