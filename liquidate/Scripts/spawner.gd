extends Node2D

@export var point_1: Vector2 = Vector2(-950.0, -950.0)
@export var point_2: Vector2 = Vector2(950.0, 950.0)

@onready var coin_blueprint: Resource = preload("res://scenes/coin.tscn")

# Called when the node enters the scene tree for the first time.
func get_random_point_inside(p1: Vector2, p2: Vector2) -> Vector2:
	var x_value: float = randf_range(p1.x, p2.x)
	var y_value: float = randf_range(p1.y, p2.y)
	
	var random_point_inside: Vector2 = Vector2(x_value, y_value)
	
	
	
	return(random_point_inside)

func spawn_coin(): 
	while true:
		var spawn_location = get_random_point_inside(point_1, point_2)
		var query = PhysicsPointQueryParameters2D.new()
		query.position = spawn_location
		
		if get_world_2d().direct_space_state.intersect_point(query).is_empty():
			var coin_instance: Node = coin_blueprint.instantiate()
			add_child(coin_instance)
			coin_instance.set_position(spawn_location)
			break
	
func on_event_coin_collected(value: int) -> void:
		print("test")
		spawn_coin()

func _ready():
	EventController.connect("coin_collected", on_event_coin_collected)
