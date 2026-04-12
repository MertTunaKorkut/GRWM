extends Area2D

@onready var mirror_action_label: Label = $mirror_action_label
const DIALOGUE = preload("uid://e1yl5cpqcn4p")

var at_mirror: bool = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func _on_body_entered(body: Node2D) -> void:
	at_mirror = true
	mirror_action_label.text = "[E]"


func _on_body_exited(body: Node2D) -> void:
	at_mirror = false
	mirror_action_label.text = ""

func _unhandled_key_input(event: InputEvent) -> void:
	if at_mirror && event.is_action_pressed("interact"):
		var chance := randf()
		
		
		if chance <= 0.8:
			DialogueManager.show_dialogue_balloon(DIALOGUE, "mirror_handsome")
		else:
			DialogueManager.show_dialogue_balloon(DIALOGUE, "mirror_ugly")
			
