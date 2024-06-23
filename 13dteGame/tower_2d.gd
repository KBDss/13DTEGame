extends Area2D
var target = null
var is_placed = false
const BULLET = preload("res://bullet.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if target:
		pass
		#shoot at target
	if Input.is_action_just_pressed("ui_accept"):
		if is_placed != true:
			is_placed = true


func _on_area_entered(area):
	if area.is_in_group("Enemy") and is_placed == true:
		target = area
		print("shoot")
	elif area.is_in_group("Enemy_Strong") and is_placed == true:
		target = area
		print("shoot")


func _on_timer_timeout():
	if target and is_instance_valid(target):
		var bullet = BULLET.instantiate()
		add_child(bullet)
		bullet.global_position = global_position
		bullet.rotation= get_angle_to(target.global_position)
