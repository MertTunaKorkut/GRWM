extends Node2D
@onready var bathroom_door: Area2D = $bathroom_door
@onready var player: CharacterBody2D = $Player
@onready var spawnpoint: Marker2D = $spawnpoint


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if PlayerStats.last_scene_getter() == "bathroom":
		player.global_position = spawnpoint.global_position


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func _on_bathroom_door_body_entered(_body: Node2D) -> void:
	PlayerStats.last_scene_setter("laundry_room")
	SceneLoader.load_scene.call_deferred(&"uid://bro61l20yxkxb")
