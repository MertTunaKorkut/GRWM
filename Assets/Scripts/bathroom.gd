extends Node2D

@onready var player: CharacterBody2D = $Player
@onready var spawnpoint: Marker2D = $spawnpoint

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if PlayerStats.last_scene_getter() == "corridor":
		player.global_position = spawnpoint.global_position


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
