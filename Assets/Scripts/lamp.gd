extends Area2D

@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D
@onready var lamp_action_label: Label = $lamp_action_label
@onready var panel: Panel = $"../CanvasLayer/Panel"

var at_lamp: bool = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	panel.visible = PlayerStats.living_room_light


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func _on_body_entered(_body: Node2D) -> void:
	at_lamp = true
	lamp_action_label.text = "[E]"


func _on_body_exited(_body: Node2D) -> void:
	at_lamp = false
	lamp_action_label.text = ""

func _unhandled_key_input(event: InputEvent) -> void:
	if at_lamp && event.is_action_pressed("interact"):
		PlayerStats.living_room_light_switch()
		if panel.visible:
			panel.visible = false
		else:
			panel.visible = true
