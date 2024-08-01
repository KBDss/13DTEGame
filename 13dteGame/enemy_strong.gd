extends PathFollow2D
@export var health = 7
@export var money_value = 15
@export var speed :float = 0.05

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


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
		PlayerStats.add_money(money_value)
		PlayerStats.enemys_killed += 1


func _on_area_2d_area_entered(area):
	if area.is_in_group("Bullet"):
		damage(area.damage)
		area.queue_free()
