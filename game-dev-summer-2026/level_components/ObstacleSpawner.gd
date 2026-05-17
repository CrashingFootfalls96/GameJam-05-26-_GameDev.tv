extends Node

@export var spawn_types : Dictionary[String, PackedScene]
@export var spawn_rates : Dictionary[String, float]
@export var left_bounds : Dictionary[String, int]
@export var right_bounds : Dictionary[String, int]

var _scene_pools : Dictionary[String, ScenePool]
var _pool_load : GDScript = load("res://utils/ScenePool.gd")

var _spawn_timers : Dictionary[String, Timer]

var _last_spawn_r_bound : int
var _last_spawn : Node

func _ready() -> void:
	if spawn_types.keys() != spawn_rates.keys():
		print("Obstacle Spawner Error: Keys do not match")
		return
	for type in spawn_types.keys():
		_scene_pools[type] = _pool_load.new(spawn_types[type], 10)
		
func start() -> void:
	pass
