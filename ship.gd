extends Area2D

var bullet := preload("res://bullet.tscn")
var speed := 2
var can_shoot := true

func die() -> void:
	pass

func shoot() -> void:
	var bullet_instance = bullet.instantiate()
	bullet_instance.position = position
	get_tree().root.get_child(0).add_child(bullet_instance)
	print(position)

func _physics_process(_delta: float) -> void:
	var move_direction = Input.get_axis("move_left", "move_right")
	position.x += move_direction * speed
	
	if Input.is_action_pressed("shoot") and can_shoot:
		can_shoot = false
		shoot()
		$Timer.start()


func _on_timer_timeout() -> void:
	can_shoot = true
