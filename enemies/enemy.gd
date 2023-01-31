extends CharacterBody2D

@export var speed: = 200.0

var target: Node2D = null


func _ready() -> void:
	target = get_tree().root.get_node("Main/Player")


func _physics_process(delta: float) -> void:
	velocity = lerp(velocity, global_position.direction_to(target.global_position) * speed, delta * 20)
	if move_and_slide():
		get_tree().quit()
	
