extends Control

func _ready() -> void:
	get_tree().paused=false

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_accept"):
		get_tree().change_scene_to_file("res://scenes/game.tscn")
