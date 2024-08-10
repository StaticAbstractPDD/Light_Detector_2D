@tool
extends Node2D

signal Thresshold_reach()
@export var Thresshold: float = 0
@export var rectangle: Rect2 = Rect2(-1,-1,1,1): 
	set(value):
		rectangle = value
		queue_redraw()
var value: float

func _ready():
	LightManager.viewport_draw.connect(on_viewport_draw)

func _draw():
	if Engine.is_editor_hint():
		draw_rect(rectangle,Color.BLACK, false)

func on_viewport_draw(text: Image):
	if global_position.clamp(Vector2(0,0),Vector2(text.get_width(),text.get_height())) == global_position:
		var color = text.get_pixelv(global_position) * 4.0
		value = color.r
		if color.r >= Thresshold:
			print("%s" % color)
			Thresshold_reach.emit()
