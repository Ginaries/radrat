extends Control


var Textos = ["Es divertido precenciar el ingenio humano para el autosabotaje",
"Llegamos al punto en que la contaminación ambiental y los desechos hicieron mutar hasta a los insectos",
"Pero esta pequeña protagonista es un hueso duro de roer, ella se adaptó a la radiación y a la escacez",
 "Y, así, nuestra compañera ratita comienza este viaje, buscando el pan (y el queso) para llevarlo a su hogar",
]
var que_texto: int = 0



func _ready():
	$AnimationPlayer.play("Crechendo")
	await $AnimationPlayer.animation_finished
	$Label.text = Textos[que_texto]
	$AnimationPlayer.play("set_texto")
	await $AnimationPlayer.animation_finished
	$Boton.show()
	
func _process(_delta):
	if Input.is_action_just_pressed("ui_down"):
		$Boton.hide()
		siguiente()

func siguiente():
	if que_texto <= Textos.size()-2:
		que_texto += 1
		if que_texto == 1:
			$primer.hide()
			$segunda.show()
			$Label.text = Textos[que_texto]
			$AnimationPlayer.play("set_texto")
			await $AnimationPlayer.animation_finished
			$Boton.show()
		if que_texto == 2:
			$segunda.hide()
			$tercero.show()
			$Label.text = Textos[que_texto]
			$AnimationPlayer.play("set_texto")
			await $AnimationPlayer.animation_finished
			$Boton.show()
		if que_texto == 3:
			$tercero.hide()
			$cuarto.show()
			$Label.text= Textos[que_texto]
			$AnimationPlayer.play("set_texto")
			await $AnimationPlayer.animation_finished
			$Boton.show()
			
	else:
		$AnimationPlayer.play("decrechendo")
		await $AnimationPlayer.animation_finished
		get_tree().change_scene_to_file("res://Scene/normal.tscn")
