extends Area3D
var bullet = preload("res://bullet.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_entered(area):
	if area.is_in_group("Enemy"):
		var instance = bullet.instantiate()
		instance.global_transform = global_transform
		add_sibling(instance) 
		 #create bullet
		# rotate bullet to enemy
		# add bullet to scene
