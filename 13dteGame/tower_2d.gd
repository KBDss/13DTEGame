extends Area2D
var target = null
var is_placed = false
const BULLET = preload("res://bullet.tscn")
var targets = [] 
@onready var targeting = $Targeting


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if target == null and len(targets)>0:
		get_target()

		
		#shoot at target
func get_target():
	target = targets.pop_front()
	
func place():
	is_placed = true

func _on_area_entered(area):
	if area.is_in_group("Enemy") and is_placed == true:
		targets.append(area)
	
		#print("shoot")
	elif area.is_in_group("Enemy_Strong") and is_placed == true:
		targets.append(area)
		#print("shoot")
	



func _on_timer_timeout():
	if target and is_instance_valid(target):
		var bullet = BULLET.instantiate()
		add_child(bullet)
		bullet.global_position = global_position
		bullet.rotation= get_angle_to(target.global_position)
		bullet.target = target #homing missile
	else:
		if targets.size() > 0:
			target = targets.pop_back()


func _on_area_exited(area):
	if area == target:
		print("target matches")
		target = get_target()
	if area.is_in_group("Enemy") and is_placed == true:
		if area in targets:
			print("remove enemy from list")
			targets.erase(area)
		
