extends Path3D


# Declare variables
@export var enemyPrefab : Resource# Enemy object to spawn
@onready var spawnTimer = $Timer

# Called when the node enters the scene tree for the first time

	# Get references to necessary nodes
	#spawnTimer = $Timer
	#enemyPrefab = preload("res://Enemy.tscn") # Load enemy scene

	# Connect the timeout signal of the timer to the spawn_enemy method


# Function to spawn a new enemy
func spawn_enemy():
	# Instantiate the enemy scene
	var enemy = enemyPrefab.instantiate()

	# Add the enemy to the scene
	add_child(enemy)


func _on_timer_timeout():
	spawn_enemy()
