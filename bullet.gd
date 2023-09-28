extends Area2D


func _physics_process(delta: float) -> void:
	position.y -= 2



func _on_area_entered(area: Area2D) -> void:
	area.queue_free()
	queue_free()


func _on_visible_on_screen_enabler_2d_screen_exited() -> void:
	queue_free()
