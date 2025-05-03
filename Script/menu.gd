extends Control


func _on_button_pressed():
	$AnimationPlayer.play("cambio de escena")
	await $AnimationPlayer.animation_finished
	get_tree().change_scene_to_file("res://Scene/presentacion.tscn")
	

func _on_button_2_pressed():
	get_tree().quit()
