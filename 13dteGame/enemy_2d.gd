extends PathFollow2D
var health = 2
@export var speed :float = 0.1

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	progress_ratio = move_toward(progress_ratio,1, speed* delta)
	if progress_ratio >=1:
		queue_free()
		
func damage(dmg = 1):
	health -= dmg
	#check if health less than zero and delete from scene if so
	if health <= 0:
		queue_free()


func _on_area_2d_area_entered(area):
	pass
