extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_playbutton_pressed() -> void:
	get_tree().change_scene_to_file("res://sandbox.tscn")
	# make so that when pressed you go to a level select screen 
	# or sandbox mode screen


func _on_controlsbutton_pressed() -> void:
	get_tree().change_scene_to_file("res://helpscreen.tscn")
	# make so that when pressed go to a UI screen that tells all controls
	# ex: dash = Z
	# also maybe change this to a help tab instead of just controls
	# like its controls but with some other things too maybe


func _on_quitbutton_pressed() -> void:
	get_tree().quit(0)
