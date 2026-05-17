extends Node

@onready var _start_menu : Node2D = $UI/StartMenu
@onready var _level_select : Node2D = $UI/LevelSelect
@onready var _pause_menu : Node2D = $UI/PauseMenu
@onready var _game_ui : Node2D = $UI/GameUI
@onready var _level_node : Node2D = $Level

enum GAME_STATE {PAUSED, INGAME, START, LEVEL}
var game_state = GAME_STATE.START

var _level_loads : Dictionary[String, PackedScene]
var _current_scene : Node2D
var _level_api : LevelAPI = load("res://utils/LevelAPI.gd").new()

func _ready() -> void:
	_show_start_menu()
	_start_menu.play_click.connect(_show_level_select)
	_level_select.level_click.connect(_load_level)
	
	
func _load_level(level_path : String) -> void:
	## ideally, level should be loaded on sperate thread
	var load : PackedScene = load(level_path)
	## optionally, add the scene to level loads so we can use them again
	_level_loads["some_key"] =  load
	_level_api.reset()
	_current_scene = load.instantiate()
	_current_scene.give_api(_level_api)
	_level_node.add_child(_current_scene)
	_show_game_ui()
	game_state = GAME_STATE.INGAME


func _unhandled_key_input(event: InputEvent) -> void:
	if event.is_action_pressed("pause_click"):
		_toggle_pause()

func _toggle_pause() -> void:
	if game_state == GAME_STATE.INGAME:
		game_state = GAME_STATE.PAUSED
		# Hypothetically works but sideeffect: stops listening for keyboard input
		#_current_scene.get_tree().paused = true
		_show_pause_menu()
	elif game_state == GAME_STATE.PAUSED:
		game_state = GAME_STATE.INGAME
		#_current_scene.get_tree().paused = false
		_show_game_ui()

func _hide_menus() -> void:
	_start_menu.visible = false
	_level_select.visible = false
	_pause_menu.visible = false
	_game_ui.visible = false
	
func _show_start_menu() -> void:
	_hide_menus()
	_start_menu.visible = true
	
func _show_level_select() -> void:
	_hide_menus()
	_level_select.visible = true
	
func _show_pause_menu() -> void:
	_hide_menus()
	_pause_menu.visible = true
	
func _show_game_ui() -> void:
	_hide_menus()
	_game_ui.visible = true
