extends Area2D

@onready var door_action_label: Label = $door_action_label
@export var next_scene: StringName = &""
@export var door_scene: String = ""

var at_door: bool = false

func _on_body_entered(_body: Node2D) -> void:
	door_action_label.text = '[E]'
	at_door = true
	

func _on_body_exited(_body: Node2D) -> void:
	door_action_label.text = ""
	at_door = false

func _unhandled_key_input(event: InputEvent) -> void:
	if  at_door && event.is_action_pressed("interact"):
		PlayerStats.last_scene_setter(door_scene)
		SceneLoader.load_scene.call_deferred(next_scene)
