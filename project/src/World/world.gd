# Copyright (c) 2023 Matthew Brennan Jones <matthew.brennan.jones@gmail.com>
# This file is licensed under the MIT License
# https://github.com/ImmersiveRPG/ExampleGodotThrottle

extends Node3D

const _ball_scene : PackedScene = preload("res://src/Ball/ball.tscn")

func _on_button_spawn_balls_pressed() -> void:
	for n in 500:
		# Add ball
		var ball := _ball_scene.instantiate()
		self.add_child(ball)

		# Give ball random position around center
		const r := 25.0
		ball.transform.origin = Vector3(
			randf_range(-r, r),
			3.0,
			randf_range(-r, r),
		)


func _on_fps_timer_timeout() -> void:
	var fps := Engine.get_frames_per_second()
	var title := "FPS: %s" % [fps]
	self.get_window().set_title(title)

