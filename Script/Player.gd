extends CharacterBody2D



var mover = 200
var jump_force = 500
var wind_force = 0
var gravity = 500

var respawn_position = Vector2.ZERO
var is_paused = false
@onready var Cajas = get_tree().get_nodes_in_group("Cajas") 
var murio = false

func _ready():
	respawn_position = position

func _physics_process(delta):
	if is_paused:
		return
	if is_on_floor() and Input.is_action_just_pressed("ui_up") :
		velocity.y = -jump_force
		$AnimatedSprite2D.play("jump")

	if Input.is_action_pressed("ui_right"):
		velocity.x = mover
		$AnimatedSprite2D.flip_h= false
		if is_on_floor():
			$AnimatedSprite2D.play("walk")
			if Input.is_action_just_pressed("ui_up"):
				$AnimatedSprite2D.stop()
				$AnimatedSprite2D.play("jump")
			
	elif Input.is_action_pressed("ui_left"):
		velocity.x = -mover -wind_force 
		$AnimatedSprite2D.flip_h= true
		if is_on_floor():
			$AnimatedSprite2D.play("walk")
			if Input.is_action_just_pressed("ui_up"):
				$AnimatedSprite2D.stop()
				$AnimatedSprite2D.play("jump")
	else:
		velocity.x = -wind_force
		
		
	
	

	velocity.y += gravity * delta
	move_and_slide()

	

func _on_mecai_body_entered(_body):
	if is_paused:
		return
	$AnimatedSprite2D.stop()
	Global.count_death += 1
	position = respawn_position
	
	var label = get_node("Label")
	label.text = "Muerte: " + str(Global.count_death)
	murio = true
	for caja in Cajas:
		caja.respawn()
	$"../Dialogos".dialogos_al_revivir()
	



func _on_pinches_body_entered(_body):
	if is_paused:
		return
	$AnimatedSprite2D.stop()
	Global.count_death += 1
	position = respawn_position
	var label = get_node("Label")
	label.text = "Muerte: " + str(Global.count_death)
	murio = true
	for caja in Cajas:
		caja.respawn()
	$"../Dialogos".dialogos_al_revivir()

func pause_character():
	$AnimatedSprite2D.stop()
	is_paused = true

func resume_character():
	is_paused = false

func _input(event) -> void:
	if event.is_action_pressed("ui_down"):
		resume_character()
		$"../Dialogos".hide()


func set_respawn_position(new_position:Vector2):
	respawn_position = new_position





func _on_bola_body_entered(_body):
	if is_paused:
		return

	Global.count_death += 1
	position = respawn_position
	var label = get_node("Label")
	label.text = "Muerte: " + str(Global.count_death)
	murio = true
	for caja in Cajas:
		caja.respawn()
	$"../Dialogos".dialogos_al_revivir()






func _on_mejora_velocidad_body_entered(_body):
	mover += 300
	$"../Timer".start()
	
	


func _on_timer_timeout():
	mover = 200
	$"../Timer".stop()
	


func _on_agua_body_entered(_body):
	mover = 200
	


func _on_area_2d_body_entered(_body):
	get_tree().change_scene_to_file("res://Scene/creditos.tscn")
