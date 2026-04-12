extends Area2D

@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D
@onready var piano_action_label: Label = $piano_action_label
@onready var piano_sound_player_e_5: AudioStreamPlayer2D = $piano_sound_player_E5
@onready var timer: Timer = $Timer
@onready var piano_sound_player_e_4: AudioStreamPlayer2D = $piano_sound_player_E4

var at_piano: bool = false
var note_counter: int = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func _on_body_entered(_body: Node2D) -> void:
	at_piano = true
	piano_action_label.text = "[E]"


func _on_body_exited(_body: Node2D) -> void:
	at_piano = false
	piano_action_label.text = ""

func _unhandled_key_input(event: InputEvent) -> void:
	if at_piano && event.is_action_pressed("interact") && note_counter < 3:
		piano_sound_player_e_5.play()
		note_counter = (1 + note_counter) % 4
		if note_counter == 0:
			timer.start()
	elif at_piano && event.is_action_pressed("interact") && note_counter == 3:
		piano_sound_player_e_4.play()
		note_counter = (1 + note_counter) % 4

func _on_timer_timeout() -> void:
	note_counter = 0
