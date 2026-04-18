extends Node2D

@onready var player: CharacterBody2D = $Player
@onready var spawnpoint: Marker2D = $spawnpoint
@onready var laundry_room_door: Area2D = $laundry_room_door
@onready var spawnpoint_2: Marker2D = $spawnpoint2


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if PlayerStats.last_scene_getter() == "corridor":
		player.global_position = spawnpoint.global_position
	elif PlayerStats.last_scene_getter() == "laundry_room":
		player.global_position = spawnpoint_2.global_position
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func _on_laundry_room_door_body_entered(_body: Node2D) -> void:
	PlayerStats.last_scene_setter("bathroom")
	SceneLoader.load_scene.call_deferred(&"uid://bddlgf6g386hd")
