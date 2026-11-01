extends Area2D

const SPEED =500
signal GameOver

func _ready() -> void:
	position.x = 1200
	position.y = 520


func _process(delta: float) -> void:
	position.x-=SPEED*delta
	if position.x < -50:
		queue_free()


func _on_body_entered(body: Node2D) -> void:
	if body.name=="ball" or body.is_in_group("ball"):
		emit_signal("GameOver")
		get_tree().paused = true
		await get_tree().create_timer(3).timeout
		get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
