extends CharacterBody2D

const SPEED = 300.0
@export var side = 'p1'

func _physics_process(delta):
	var direction 
	
	if side == 'p1':
		direction = get_axis(KEY_W, KEY_S)
	else:
		direction = get_axis(KEY_I, KEY_K)
		
	if direction:
		velocity.y = direction * SPEED
	else:
		velocity.y = move_toward(velocity.y, 0, SPEED)

	move_and_slide()
	
func get_axis(up, down):
	if Input.is_key_pressed(up): return -1
	elif Input.is_key_pressed(down): return 1

func _on_area_2d_body_entered(body):
	body.direction.x *= -1
	Main.side = side
	
	var ball_sprite = get_parent().get_node("Ball/Sprite2D_ball")
	if ball_sprite != null:
		if body.direction.x == -1:
			var new_texture = preload("res://assets/bola2.png")
			ball_sprite.texture = new_texture
		else:
			var new_texture = preload("res://assets/bola1.png")
			ball_sprite.texture = new_texture
	
	var sound_player = get_parent().get_node("AudioStreamPlayer2D")
	sound_player.play()
