extends Area2D

enum State{DOWN, SIDE}

var current_state := State.SIDE
var number_of_step := 9
var step_size := 2
var steps_made := 0
var side := 1


func move_sideways() -> void:
	steps_made += 1
	position.x += step_size * side

func move_down() -> void:
	steps_made += 1
	position.y += step_size

func invert_side() -> void:
	side *= -1

func reset_steps() -> void:
	steps_made = 0


func _on_timer_timeout() -> void:
	if current_state == State.SIDE:
		if steps_made < number_of_step:
			move_sideways()
		else:
			current_state = State.DOWN
			reset_steps()
			invert_side()
			
	elif current_state == State.DOWN:
		if steps_made < 2:
			move_down()
		else:
			current_state = State.SIDE
			reset_steps()
