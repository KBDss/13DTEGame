extends Path2D


# Declare variables
@export var enemyEngineer = preload("res://enemy_2d.tscn")
@export var enemyStrong = preload("res://enemy_strong.tscn")
@onready var spawnTimer = $Timer

# Called when the node enters the scene tree for the first time

	# Get references to necessary nodes
	#spawnTimer = $Timer
	#enemyPrefab = preload("res://Enemy.tscn") # Load enemy scene

	# Connect the timeout signal of the timer to the spawn_enemy method


# Function to spawn a new enemy
func spawn_enemy_engineer():
	# Instantiate the enemy scene
	var enemy = enemyEngineer.instantiate()
	#print("Spawn enemy")
	# Add the enemy to the scene
	add_child(enemy)

func spawn_enemy_strong():
	# Instantiate the enemy scene
	var enemy = enemyStrong.instantiate()
	#print("Spawn enemy")
	# Add the enemy to the scene
	add_child(enemy)


func _on_timer_timeout():
	spawn_enemy_engineer()





func _on_strong_wave_timer_start_timeout():
	$StrongWaveTimerStart/StrongTimer.start()


func _on_strong_timer_timeout():
	spawn_enemy_strong()
