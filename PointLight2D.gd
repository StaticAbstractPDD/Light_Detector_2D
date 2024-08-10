extends PointLight2D
@onready var shape = $Area2D/CollisionShape2D

# Called when the node enters the scene tree for the first time.
func _ready():
	shape.shape = RectangleShape2D.new()
	shape.shape.size = texture.get_size()*texture_scale
	shape.global_position += offset
	

