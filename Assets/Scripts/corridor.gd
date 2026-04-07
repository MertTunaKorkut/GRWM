extends Node2D

@onready var player: CharacterBody2D = $Player
@onready var living_room_spawnpoint: Marker2D = $living_room_spawnpoint
@onready var kid_bedroom_spawnpoint: Marker2D = $kid_bedroom_spawnpoint
@onready var parent_bedroom_spawnpoint: Marker2D = $parent_bedroom_spawnpoint
@onready var bathroom_spawnpoint: Marker2D = $bathroom_spawnpoint
@onready var office_spawnpoint: Marker2D = $office_spawnpoint



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var last_scene = PlayerStats.last_scene_getter()
	
	print("KORIDORA GELDİK. GELINEN YER: ", last_scene)
	match last_scene:
		"living_room":
			player.global_position = living_room_spawnpoint.global_position
		"office":
			player.global_position = office_spawnpoint.global_position
		"bathroom":
			player.global_position = bathroom_spawnpoint.global_position
		"parent_bedroom":
			player.global_position = parent_bedroom_spawnpoint.global_position
		"kid_bedroom":
			player.global_position = kid_bedroom_spawnpoint.global_position
		
	#if last_scene == "living_room":
		#player.global_position = living_room_spawnpoint.global_position
	#elif last_scene ==  "bathroom":
		#player.global_position = bathroom_spawnpoint.global_position
	#elif last_scene == "office":
		#player.global_position = office_spawnpoint.global_position
	#elif last_scene == "parent_bedroom":
		#player.global_position = parent_bedroom_spawnpoint.global_position
	#elif last_scene == "kid_bedroom":
		#player.global_position = kid_bedroom_spawnpoint.global_position


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
