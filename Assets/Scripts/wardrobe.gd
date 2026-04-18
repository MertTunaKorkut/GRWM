extends Area2D
@onready var wardrobe_action_label: Label = $wardrobe_action_label
@onready var wardrobe: Sprite2D = $"../wardrobe"

var at_wardrobe: bool = false
var open: bool = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func _on_body_entered(_body: Node2D) -> void:
	at_wardrobe = true
	wardrobe_action_label.text = "[E]"


func _on_body_exited(_body: Node2D) -> void:
	at_wardrobe = false
	wardrobe_action_label.text = ""

func _unhandled_key_input(event: InputEvent) -> void:
	if at_wardrobe && !open && event.is_action_pressed("interact"):
		wardrobe.visible = true
		open = true
	elif at_wardrobe && open && event.is_action_pressed("interact"):
		if PlayerStats.clothing_stats.y == 0:
			PlayerStats.clothing_stats.y = 1
			
		elif PlayerStats.clothing_stats.y == 1:
			wardrobe.visible = false
			open = false
