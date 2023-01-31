extends Area2D

@export var speed: = 500.0
@export var acceleration: = 30.0
@export var life_time: = 2.0

var velocity: = Vector2.ZERO
var direction: = Vector2.ZERO
var _life_time: = life_time


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	_life_time -= delta
	if _life_time < 0:
		queue_free() 
	


func _physics_process(delta: float) -> void:
	rotation += delta * 20
	velocity = lerp(velocity, direction * speed, acceleration * delta)
	position += velocity * delta


func _on_body_entered(body: Node2D) -> void:
	queue_free()
	body.queue_free()
