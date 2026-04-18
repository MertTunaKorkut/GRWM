extends Sprite2D
@onready var area_2d: Area2D = $Area2D
@onready var collision_shape_2d: CollisionShape2D = $Area2D/CollisionShape2D
@onready var bag_action_label: Label = $bag_action_label

var at_bag: bool = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func _on_area_2d_body_entered(_body: Node2D) -> void:
	if visible:
		at_bag = true
		bag_action_label.text = "[E]"


func _on_area_2d_body_exited(_body: Node2D) -> void:
	at_bag = false
	bag_action_label.text = ""

func _unhandled_key_input(event: InputEvent) -> void:
	if at_bag && event.is_action_pressed("interact") && visible:
		PlayerStats.clothing_stats.z = 1
		visible = false
		
