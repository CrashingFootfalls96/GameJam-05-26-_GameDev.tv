class_name ObjectPool
extends RefCounted

var _object_class : String
var _max_threads : int
var _desired_size : int
var _loaded : PackedScene
var _threads : Array[Thread]
var _last_inst_times : Array[float]
var _last_request_times : Array[float]
var _inst_avg : float
var _req_avg : float

func _init(object_path : String, max_threads : int, desired_size) -> void:
	_loaded = load(object_path)
	_object_class = _loaded.get_class()
	_max_threads = max_threads
	
func _to_string() -> String:
	return "----- ObjectPool -----
  Class Name: " + _object_class + "
  Max Threads: " + str(_max_threads) + "
  "

func get_scene() ->  Node:
	return _loaded.instantiate()
