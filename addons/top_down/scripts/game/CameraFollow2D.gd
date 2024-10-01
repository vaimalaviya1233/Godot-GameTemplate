#class_name CameraFollow2D
extends Camera2D

@export var follow:bool = true
@export var target:Node2D

## Toggles camera's following functionality
func set_follow(value:bool)->void:
	follow = value
	set_physics_process(follow && target != null)

func set_target(value:Node2D)->void:
	target = value
	set_physics_process(follow && target != null)

func _ready()->void:
	set_target(target)
	set_physics_process(follow && target != null)

func _physics_process(_delta:float)->void:
	if target == null:
		set_follow(false)
		return
	global_position = target.global_position