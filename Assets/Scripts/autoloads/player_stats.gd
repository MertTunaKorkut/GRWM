extends Node

var clothed: bool = false
var last_scene: String = ""
var living_room_light: bool = true
var living_room_tv: bool = false
var telephone: bool = true

func last_scene_setter(scene_name: String) -> void:
	last_scene = scene_name

func last_scene_getter() -> String:
	return last_scene

func living_room_light_switch() -> void:
	living_room_light = !living_room_light

func living_room_tv_switch() -> void:
	living_room_tv = !living_room_tv

func telephone_switch() -> void:
	telephone = !telephone
	
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
