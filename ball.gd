extends CharacterBody2D

const SPEED = 300.0
var direction = Vector2.ZERO

func _ready():
	direction.y = [1,-1].pick_random()
	direction.x = [1,-1].pick_random()    
	
	if direction.x > 0:
		var new_texture = preload("res://assets/bola1.png")
		var ball_sprite = $Sprite2D_ball 
		ball_sprite.texture = new_texture
	else: 
		var new_texture = preload("res://assets/bola2.png")
		var ball_sprite = $Sprite2D_ball 
		ball_sprite.texture = new_texture
		

func _physics_process(delta):

	if direction:
		velocity = direction * SPEED
	else:
		velocity = velocity.move_toward(Vector2.ZERO, SPEED)

	move_and_slide()
