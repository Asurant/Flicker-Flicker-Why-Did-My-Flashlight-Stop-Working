class_name Player extends CharacterBody2D

const SPEED = 200
@onready var timer := $Timer
@onready var light := $Flashlight

func _ready() -> void:
	timer.start()

func _physics_process(delta: float) -> void:
	look_at(get_global_mouse_position())
	
	velocity.x = Input.get_axis("left", "right")*SPEED
	velocity.y = Input.get_axis("up", "down")*SPEED
	
	velocity = lerp(get_real_velocity(), velocity, 0.1)
	
	move_and_slide()

func _on_timer_timeout() -> void:
	var rand_amt := (randf())
	light.energy = rand_amt
	
	if rand_amt < 0.005:
		light.energy = 0
		timer.start(1)
	elif rand_amt < 0.01:
		light.energy = randf_range(0.2, 0.4)
		timer.start(randf_range(0.02, 0.09))
	elif rand_amt < 0.25:
		light.energy = randf_range(0.5, 0.8)
		timer.start(randf_range(0.03, 0.07))
	else:
		light.energy = randf_range(0.9, 1.02)
		timer.start(randf_range(0.03, 0.06))
		
		
		
		
