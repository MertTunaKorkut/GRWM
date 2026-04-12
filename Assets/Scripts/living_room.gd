extends Node2D
@onready var spawnpoint: Marker2D = $spawnpoint
@onready var player: CharacterBody2D = $Player
@onready var living_room_cat: Area2D = $living_room_cat


var anim_chooser: int

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	living_room_cat.random_anim_player()
	
	if PlayerStats.last_scene_getter() == "corridor":
		player.global_position = spawnpoint.global_position


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
