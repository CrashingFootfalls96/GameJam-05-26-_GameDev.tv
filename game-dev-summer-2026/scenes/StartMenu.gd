extends Node

signal play_click

func _ready() -> void:
	$PlayButton.pressed.connect(func(): emit_signal("play_click"))
