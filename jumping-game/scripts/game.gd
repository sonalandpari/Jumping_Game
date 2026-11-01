extends Node

var score = 0
const obstacle_spawn = preload("res://scenes/obstacle.tscn")


func _ready() -> void:
	$Timer.timeout.connect(clone)
	$score.position=Vector2(800,5)
	$ball.position=Vector2(200,475)
	$GameOver.visible=false

func _process(delta: float) -> void:
	score+= delta*10
	$score.text="SCORE: " + str(int(score))

func clone():	
	var new_obstacle = obstacle_spawn.instantiate()
	new_obstacle.position = Vector2(1200, 520)
	new_obstacle.GameOver.connect(on_game_over)
	add_child(new_obstacle)
	$Timer.wait_time = randf_range(1, 2.2)

func on_game_over():
	get_tree().paused = true
	$GameOver.visible=true
	await get_tree().create_timer(2).timeout
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
	
