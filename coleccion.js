
$(document).ready(function(){

	//Inicializamos variables de sesion vacias.
	localStorage['seleccion'] = "";
	localStorage['mostrar'] = "no";


	// Creamos funcion que se ejecutara cada segundo, lo mas cercano a un clic, se puede manipular como 
	// se desee el tiempo.
	setInterval(function(){
		if(localStorage['mostrar'] == "si"){
				var variable = localStorage['seleccion'];
 				//$("#barra-busqueda").val(variable);
 				
 					 		$('body,html').animate({ scrollTop:'550vh' },1000); 		

 				//

				const grid = new Muuri('.grid',{
										    layout:{
										        rounding: false
										    }
										});
				const busqueda = variable;
        		grid.filter( (item) => item.getElement().dataset.etiqueta.includes(busqueda) );
				localStorage['mostrar'] = "no";
				

			}
	},1000);
});


function ValidarSeleccion(){
	if(localStorage['mostrar'] = "si"){
		var variable = localStorage['seleccion'];
 		$("#barra-busqueda").val(variable);
		localStorage['mostrar'] = "no";
	}
}

 $(document).ready(function(){
 
	$('.ir-arriba').click(function(){
		$('body, html').animate({
			scrollTop: '0px'
		}, 300);
	});
 
	$(window).scroll(function(){
		if( $(this).scrollTop() > 0 ){
			$('.ir-arriba').slideDown(300);
		} else {
			$('.ir-arriba').slideUp(300);
		}
	});
 
});

