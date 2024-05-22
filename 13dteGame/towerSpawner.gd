extends Node3D

var tower_scene = preload("res://tower.tscn")
var tower_instance = null

func _input(event):
	if event is InputEventKey and Input.is_action_pressed("new_tower"):
		if not tower_instance:
			tower_instance = tower_scene.instantiate()
			print("adding tower")
			add_child(tower_instance)

func _process(delta):
	if tower_instance:
		#print("update position")
		# Get the mouse position in 3D space using a raycast
		var mouse_pos = get_global_mouse_position_3d()
		#print(mouse_pos)
		if mouse_pos:
			tower_instance.global_transform.origin = mouse_pos

	if Input.is_action_pressed("ui_accept") and tower_instance:
		var mouse_pos = get_global_mouse_position_3d()
		if mouse_pos:
			# Snap to grid, change 1 to your desired grid size in 3D
			var snap_pos = Vector3(round(mouse_pos.x), round(mouse_pos.y), round(mouse_pos.z))
			tower_instance.global_transform.origin = snap_pos
			tower_instance = null

func get_global_mouse_position_3d():
	var camera = get_viewport().get_camera_3d()
	
	var mouse_pos = get_viewport().get_mouse_position()

	var from = camera.project_ray_origin(mouse_pos)

	var to = from + camera.project_ray_normal(mouse_pos) * camera.far

	var space_state = get_world_3d().direct_space_state
	
	var query = PhysicsRayQueryParameters3D.create(from, to)

	var result = space_state.intersect_ray(query)
	#print(result)
	if result:
		return result["position"]
	return null
