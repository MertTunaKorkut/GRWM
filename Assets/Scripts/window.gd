extends Area2D

@onready var window_action_label: Label = $window_action_label
const DIALOGUE = preload("uid://e1yl5cpqcn4p")

var at_window: bool = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func _on_body_entered(_body: Node2D) -> void:
	at_window = true
	window_action_label.text = "[E]"


func _on_body_exited(_body: Node2D) -> void:
	at_window = false
	window_action_label.text = ""

func _unhandled_key_input(event: InputEvent) -> void:
	if PlayerStats.is_in_dialogue:
		return
	
	if at_window && event.is_action_pressed("interact"):
		DialogueManager.show_dialogue_balloon(DIALOGUE, "living_room_window")
