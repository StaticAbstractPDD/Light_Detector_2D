#@tool
extends Node2D

signal Thresshold_reach()
@export var Thresshold: float = 0
@export var rectangle: Rect2 = Rect2(-1,-1,1,1): 
	set(value):
		rectangle = value
		queue_redraw()
var value: float

func _draw():
	if Engine.is_editor_hint():
		draw_rect(rectangle,Color.BLACK, false)

