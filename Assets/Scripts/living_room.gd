extends Node2D
@onready var spawnpoint: Marker2D = $spawnpoint
@onready var player: CharacterBody2D = $Player
@onready var living_room_cat: Area2D = $living_room_cat
@onready var spawnpoint_2: Marker2D = $spawnpoint2
@onready var kitchen_door: Area2D = $kitchen_door


var anim_chooser: int

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	living_room_cat.random_anim_player()
	
	if PlayerStats.last_scene_getter() == "corridor":
		player.global_position = spawnpoint.global_position
	elif PlayerStats.last_scene_getter() == "kitchen":
		player.global_position = spawnpoint_2.global_position


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func _on_kitchen_door_body_entered(body: Node2D) -> void:
	PlayerStats.last_scene_setter("living_room")
	SceneLoader.load_scene.call_deferred(&"uid://cw2abse4cqdmh")
