extends Area2D

@onready var hitbox = $CollisionShape2D
@onready var sprite = get_parent()

var timer = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if timer > 0:
		timer -= delta
	elif timer <= 0:
		sprite.visible = true
		hitbox.set_deferred("disabled", false)


func _on_body_entered(body: Node2D) -> void:
	if body.name == "character":
		Eventbus.resetdash.emit()
		
		sprite.visible = false
		hitbox.set_deferred("disabled", true)
		timer = 3
