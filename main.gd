extends Node

const enemy_scene: PackedScene = preload("res://enemies/enemy.tscn")

@export var max_enemies: = 10
@export var spawn_distance: = 200.0

@onready var timer: Timer = $Timer
@onready var player: CharacterBody2D = $Player


func _on_timer_timeout() -> void:
	if get_tree().get_nodes_in_group("enemy").size() < max_enemies:
		var enemy = enemy_scene.instantiate()
		enemy.global_position = player.global_position + Vector2.ONE.rotated(randf() * PI) * spawn_distance
		add_child(enemy)
