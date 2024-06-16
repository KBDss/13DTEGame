extends Area2D
var target = null

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if target:
		pass
		#shoot at target


func _on_area_entered(area):
	if area.is_in_group("Enemy"):
		target = area
