extends Node2D

func _process(delta):
	$Label.text = str(Main.p1_score)
	$Label2.text = str(Main.p2_score)
	
func _on_top_body_entered(body):
	body.direction.y *= -1
	var sound_player = $AudioStreamPlayer2D
	sound_player.play()

func _on_bottom_body_entered(body):
	body.direction.y *= -1
	var sound_player = $AudioStreamPlayer2D
	sound_player.play()

func _on_left_body_entered(body):
	body.queue_free()
	var e = preload("res://Ball.tscn").instantiate()
	e.global_position = Vector2(588, 327)
	add_child(e)
	Main.p2_score += 1

func _on_rigtht_body_entered(body):
	body.queue_free()
	var e = preload("res://Ball.tscn").instantiate()
	e.global_position = Vector2(588, 327)
	add_child(e)
	Main.p1_score += 1
