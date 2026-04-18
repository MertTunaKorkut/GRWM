extends Area2D

@onready var timer_before_ringing: Timer = $timer_before_ringing
@onready var tel_action_label: Label = $tel_action_label
@onready var audio_stream_player_2d: AudioStreamPlayer2D = $AudioStreamPlayer2D


var at_tel: bool = false


# Called when the node enters the scene tree for the first time.

func _ready() -> void:
	if PlayerStats.telephone == true:
		timer_before_ringing.wait_time = randi_range(20, 40)
		timer_before_ringing.start()



func _on_body_entered(_body: Node2D) -> void:
	at_tel = true
	if audio_stream_player_2d.playing:
		tel_action_label.text = "[E]"

func _on_body_exited(_body: Node2D) -> void:
	at_tel = false
	tel_action_label.text = ""


func _on_timer_before_ringing_timeout() -> void:
	audio_stream_player_2d.play()
	timer_before_ringing.queue_free()

func  _unhandled_key_input(event: InputEvent) -> void:
	if PlayerStats.is_in_dialogue:
		return
	
	if at_tel && event.is_action_pressed("interact"):
		PlayerStats.telephone_switch()
		audio_stream_player_2d.stop()
		tel_action_label.text = ""
