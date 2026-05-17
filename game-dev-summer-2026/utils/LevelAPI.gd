class_name LevelAPI
extends RefCounted

signal level_pass
signal level_fail
signal level_quit

var player_score : int = 0
var player_time : int = 0

func fail_level() -> void:
	emit_signal("level_fail")
	
func pass_level() -> void:
	emit_signal("pass_fail")
	
func quit_level() -> void:
	emit_signal("level_quit")
	
func reset() -> void:
	player_score = 0
	player_time = 0
