extends Polygon2D

@export var border_color: Color = Color.BLACK
@export var border_width: float = 2.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func _draw() -> void:
	var pts = polygon.duplicate()
	pts.append(polygon[0]) # close the loop
	draw_polyline(pts, border_color, border_width, true)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
	
