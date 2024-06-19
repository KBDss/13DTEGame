extends Node2D

var tower_scene = preload("res://tower_2d.tscn")
var tower_instance = null
var placing = false
func _input(event):
	
	if event is InputEventKey and Input.is_action_pressed("new_tower"):
		if not tower_instance:
			PlayerStats.money-= 100
			tower_instance = tower_scene.instantiate()
			add_child(tower_instance)

	if tower_instance:
		#print("update position")
		# Get the mouse position in 3D space using a raycast
		var mouse_pos = get_global_mouse_position()
		#print(mouse_pos)
		if mouse_pos:
			tower_instance.global_position = mouse_pos

	if Input.is_action_pressed("ui_accept") and tower_instance:
		tower_instance = null
			# Snap to grid, change 1 to your desired grid size in 3D
			
