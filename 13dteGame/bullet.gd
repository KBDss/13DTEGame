extends Area2D
@export var damage = 1
@export var speed = 500
var target
#var speed = 10
#var target
## Called when the node enters the scene tree for the first time.
#
func _process(delta):
	#look_at(target.global_position) #homing missile
	position += transform.x * speed * delta
#func set_target(v):
	#target = v
	#print(target)
## Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
	#var direction = (target - global_transform.origin).normalized()
	##var direction = -global_transform.basis.z.normalized()
	## Move the bullet forward in its local space
	#translate(direction * speed * delta)
	#
#func _on_area_entered(area):
	#if area.is_in_group("enemy"):
		#pass
		 ##run the damage function on the enemy
		##remember that area will refer to the enemy
