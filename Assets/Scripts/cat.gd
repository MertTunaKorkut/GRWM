extends Area2D

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func random_anim_player() -> void:
	var anim_num: int = randi_range(1,5)
	match anim_num:
		1:
			animated_sprite_2d.play("itch")
		2:
			animated_sprite_2d.play("licking_1")
		3:
			animated_sprite_2d.play("licking_2")
		4:
			animated_sprite_2d.play("sleeping_1")
		5:
			animated_sprite_2d.play("sleeping_2")
