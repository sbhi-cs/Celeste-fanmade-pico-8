extends Node2D



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Global.stage += 1
	var character = get_node("character")
	character.changescreen.connect(_change_screen)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("tomenu"):
		get_tree().change_scene_to_file("res://menu_screen.tscn")
		Global.stage = 1

func _change_screen():
	get_tree().change_scene_to_file("res://stage_" + str(Global.stage+1) + ".tscn")
		
