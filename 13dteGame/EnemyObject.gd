extends PathFollow3D
var health = 2
@export var speed :int = 3
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	progress_ratio+= 1.0/speed* delta
	if progress_ratio >=1:
		queue_free()
		
func damage(dmg = 1):
	health -= dmg
	#check if health less than zero and delete from scene if so


