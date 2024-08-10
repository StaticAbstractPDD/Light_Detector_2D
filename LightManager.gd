extends Node
@onready var space_state:PhysicsDirectSpaceState2D = get_tree().current_scene.get_world_2d().direct_space_state
var point_params := PhysicsPointQueryParameters2D.new()
var ray_params := PhysicsRayQueryParameters2D.new()

func _ready():
	point_params.collide_with_areas = true 
	point_params.collision_mask = -2147483648
	
	ray_params.collision_mask = 1073741824
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	for detector in get_tree().get_nodes_in_group("LightDetector"):
		detect_at(detector.global_position)
		
func detect_at(position: Vector2):
	point_params.position = position
	var results = space_state.intersect_point(point_params, 16)
	if results:
		var final_color: Color = Color(0,0,0,0)
		for result in results:
			var parent: PointLight2D = result.collider.get_parent()
			ray_params.from = parent.global_position
			ray_params.to = position
			if not space_state.intersect_ray(ray_params):
				var localpoint = parent.to_local(position)/parent.texture_scale + parent.texture.get_size()/2
				var color: Color = parent.texture.get_image().get_pixelv(localpoint)
				final_color += color * parent.energy * parent.color
			#print(localpoint)
		if final_color.a > 0:
			print("HIT", final_color)
	else:
		print("not HIT")
