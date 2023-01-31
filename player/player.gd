extends CharacterBody2D

@export var speed: = 200.0

var bullet_scene: PackedScene = preload("res://player/bullet.tscn")


func _physics_process(delta: float) -> void:
	velocity.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	velocity.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	velocity = velocity.normalized() * speed
	move_and_slide()


func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("shoot"):
		var bullet = bullet_scene.instantiate()
		bullet.global_position = global_position
		bullet.direction = global_position.direction_to(get_global_mouse_position())
		get_tree().root.add_child(bullet)

