extends Node2D
@onready var sub_viewport = $SubViewport
var text: Image
signal viewport_draw(text: Image)
# Called when the node enters the scene tree for the first time.
func _ready():
	viewport_draw.connect($Icon/Light_Detector.on_viewport_draw)
	sub_viewport.world_2d = get_world_2d()
	RenderingServer.frame_post_draw.connect(on_frame_post_draw)


func on_frame_post_draw():
	text = sub_viewport.get_texture().get_image()
	viewport_draw.emit(text)
