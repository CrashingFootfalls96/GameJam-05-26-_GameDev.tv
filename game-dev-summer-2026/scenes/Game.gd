extends Node

var _level_loads : Dictionary[String, PackedScene]
var _current_scene : Node ## I;m not sure 


func _ready() -> void:
	print("game loaded")
	AudioManager.play()
	
	print("loading a level")
	_load_level("res://levels/level1.tscn")
	
func _load_level(level_path : String) -> void:
	## this is a bad way to load a level.  
	## the level should be loaded on a seperate thread so we can play a loading
	## animation or even load it in before the user click starts game
	
	var load : PackedScene = load(level_path)
	
	## optionally, add the scene to level loads so we can use them again
	_level_loads["some_key"] =  load
	_current_scene = load.instantiate()
	$Level.add_child(_current_scene)
