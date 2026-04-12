extends Area2D

@onready var medal_action_label: Label = $medal_action_label
@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D
const DIALOGUE = preload("uid://e1yl5cpqcn4p")


var at_medal: bool = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func _on_body_entered(_body: Node2D) -> void:
	at_medal = true
	medal_action_label.text = "[E]"


func _on_body_exited(_body: Node2D) -> void:
	at_medal = false
	medal_action_label.text = ""

func _unhandled_key_input(event: InputEvent) -> void:
	if at_medal && event.is_action_pressed("interact")&& DialogueManager.balloon_active == true:
		DialogueManager.show_dialogue_balloon(DIALOGUE, "living_room_medal")
