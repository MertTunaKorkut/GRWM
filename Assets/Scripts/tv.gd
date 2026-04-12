extends Area2D

@onready var sprite_2d: Sprite2D = $Sprite2D

@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D
@onready var tv_action_label: Label = $tv_action_label

var at_tv: bool = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	sprite_2d.visible = PlayerStats.living_room_tv


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func _on_body_entered(_body: Node2D) -> void:
	at_tv = true
	tv_action_label.text = "[E]"


func _on_body_exited(_body: Node2D) -> void:
	at_tv = false
	tv_action_label.text = ""

func _unhandled_key_input(event: InputEvent) -> void:
	if at_tv && event.is_action_pressed("interact"):
		PlayerStats.living_room_tv_switch()
		if sprite_2d.visible:
			sprite_2d.visible = false
		else:
			sprite_2d.visible = true
