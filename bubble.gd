extends Area2D

@onready var hitbox = $CollisionShape2D
@onready var sprite = get_parent()
var inbubble = false
var bubbledirection = Vector2(0, 0)
var bubbleposition = Vector2(0, 0)
var timer = 0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	bubbleposition = global_position


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if timer <= 0:
		sprite.visible = true
		hitbox.set_deferred("disabled", false)
	else:
		timer -= delta
	
	if inbubble == true:
		if Input.is_action_pressed("updashcheck"):
			bubbledirection.y = -10
		elif Input.is_action_pressed("ui_down"):
			bubbledirection.y = 10
		else:
			bubbledirection.y = 0
		# for up/down
	
		if Input.is_action_pressed("ui_left"):
			bubbledirection.x = -10
		elif Input.is_action_pressed("ui_right"):
			bubbledirection.x = 10
		else:
			bubbledirection.x = 0
		
		if Input.is_action_just_pressed("dash"):
			bubbledirection = Vector2(0, 0)
			inbubble = false
			Eventbus.bubbledash.emit()
			sprite.visible = false
			hitbox.set_deferred("disabled", true)
			timer = 3
		sprite.global_position = Vector2(bubbleposition.x + bubbledirection.x, bubbleposition.y + bubbledirection.y)
	


func _on_body_entered(body: Node2D) -> void:
	Eventbus.resetdash.emit()
	Eventbus.enterbubble.emit(global_position)
	inbubble = true
	print("in bubble")
