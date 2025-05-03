extends Node2D


func _process(_delta):
	if Input.is_action_pressed("salir"):
		get_tree().quit()
