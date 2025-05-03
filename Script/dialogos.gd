extends CanvasLayer

var textos = ["Narrador: Hola pequeñín, veo que vas sin problemas! creo que eso va a empezar a cambiar con una pequeña lluvia... "]

var tutorial= ["Narrador: Bienvenido, esto es un tutorial, como te imaginarás los movimientos son muy sencillos. Pulsa el botón Derecha para avanzar y Arriba para saltar"]


var textos_muertes = ["Narrador: Eres un gamer o un payaso? porque me hace reír tu manera de jugar", 
"Narrador: Deberías dedicarte a la comedia esto es muy divertido",
"Narrador: Agradece que tu vida no depende de ganar este juego",
"Narrador: Cuál es la diferencia entre un comediante y tú jugando? Ninguna, ambos me matan de risa",
"Narrador: Sigue insistiendo tal vez no seas el mejor en esto pero me muero de risa",
"Narrador: Muerto de risa de tanto porrazo",
"Narrador: Sos pariente de la Venus de Milo, pregunto... por lo manco", 
"Narrador: Seguí practicando que no me canso de reírme",
"Narrador: Quedaste como si te hubiera agarrado un gato",
"Narrador: Rompiste el récord... de hacerme reír",
"Narrador: Creo que deberías elegir la versión no vidente,uy",
"Narrador: Cómo diría mi madre,  sos o te haces",
"Narrador: Todo es divertido si le pasa a otra persona!... o en este caso... a una rata",
"Narrador: Quizas podemos agregar un menú de dificultad mas facil la próxima vez",
"Narrador: Sabes, no pusimos la seccion de tutoriales porque creimos que no seria necesario",
"Narrador: No te vayas a caer he!",
"Narrador: Me vas a matar, de la risa!", 
"Narrador: Hace mucho no veía una presentación de stand up",
"Narrador: Cada día te superas más, en equivocarte",
"Narrador: Casi ... pero no",
"Narrador: Esa fue una caída expectacular, no lo voy a mentir",
"Narrador: Y si... hacemos un juego de hacer reir a un rey con un personaje payaso? piénsalo sería grandioso!"
]



func _on_disparador_1_body_entered(_body):
	show()
	$"../Player".is_paused= true
	$Label.text= textos[0]
	$AnimationPlayer.play("set_text")
	$"../Primera Complicacion".queue_free()
	await $AnimationPlayer.animation_finished
	$Sprite2D.show()
	$"../Player/GPUParticles2D".show()
	$"../Player".wind_force=200
	$"../Player".set_respawn_position(Vector2(400, 800))
	
	
func dialogos_al_revivir():
	if $"../Player".murio == true:
		show()
		$"../Player".is_paused= true
		var RNG = randi_range(0,22)
		$Label.text= textos_muertes[RNG]
		$AnimationPlayer.play("set_text")
		$"../Player".murio = false




func _on_tutorial_body_entered(_body):
	show()
	$"../Player".is_paused= true
	$Label.text= tutorial[0]
	$AnimationPlayer.play("set_text")
