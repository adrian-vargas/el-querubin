(function(){
	setInterval(function(){
		var slogan = document.getElementById('slogan'),
		colores_simples = [
		"#00ff00",
		"#ff0066",
		"#0099ff",
		"#ff6666",
		"#ff4d4d",
		"#ff3333",
		"#cc0000",
		"#ff1a1a",
		"#ffff00"
		];
		slogan.style.color = colores_simples[Math.floor(Math.random() * colores_simples.length)];
		slogan.style.color = colores_simples[Math.floor(Math.random() * colores_simples.length)];
	}, 1500);
}())