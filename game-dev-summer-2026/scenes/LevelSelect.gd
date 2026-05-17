extends Node

signal level_click(level_choice)

func _ready() -> void:
	$Level1.pressed.connect(func(): emit_signal("level_click", "res://levels/level1.tscn"))
	
	
