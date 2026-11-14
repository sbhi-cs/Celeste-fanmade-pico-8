extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("tomenu"):
		get_tree().change_scene_to_file("res://menu_screen.tscn")


func _on_quitbutton_pressed() -> void:
	get_tree().change_scene_to_file("res://main.tscn")
