extends Node2D

signal Thresshold_reach()
@export var Thresshold: float
var value: float

func on_viewport_draw(text: Image):
	var color := text.get_pixel(global_position.x, global_position.y) * 4
	value = color.r
	if color.r >= Thresshold:
		Thresshold_reach.emit()
