extends Node

var text: Image
signal viewport_draw(text: Image)
var viewport = preload("res://sub_viewport.tscn").instantiate()
func _enter_tree():
	add_child(viewport)

func _ready():
	viewport.world_2d = get_tree().current_scene.get_world_2d()
	RenderingServer.frame_post_draw.connect(on_frame_post_draw)


func on_frame_post_draw():
	text = viewport.get_texture().get_image()
	viewport_draw.emit(text)
