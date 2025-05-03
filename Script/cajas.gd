extends CharacterBody2D

var gravity = 500

var is_body_in_area_derecha= false

var is_body_in_area_izquierda= false

var respawn_position = Vector2.ZERO

@onready var Player = get_node("../Player")

func _ready():
	respawn_position = position


func _physics_process(delta):
	position.y += gravity * delta
	if is_body_in_area_izquierda:
		position.x += 6 
	if is_body_in_area_derecha:
		position.x -= 6 
	move_and_slide()

func _on_izquierda_body_entered(body):
	if body.name == "Player":
		is_body_in_area_izquierda = true

func _on_izquierda_body_exited(body):
	if body.name == "Player":
		is_body_in_area_izquierda = false

func _on_derecha_body_entered(body):
	if body.name == "Player":
		is_body_in_area_derecha = true

func _on_derecha_body_exited(body):
	if body.name == "Player":
		is_body_in_area_derecha = false
		
func respawn():
	if Player.murio == true:
		position = respawn_position
