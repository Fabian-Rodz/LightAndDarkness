extends Camera2D

@export var move_speed = 0.5
@export var zoom_speed = 0.05
@export var min_zoom = 0.1
@export var max_zoom = 0.3
@export var margin = Vector2(400,200)

var players = []

@onready var screen_size = get_viewport_rect().size

func add_target(player):
	if player not in players:
		players.append(player)

func remove_target(player):
	if player in players:
		players.remove(player)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if !players:
		return
	
	# Tracking and centering camera
	var cam_position = Vector2.ZERO
	for player in players:
		cam_position += player.position
	cam_position /= players.size()
	position = lerp(position, cam_position, move_speed)
	
	# Adjusting zoom
	var cam_rect = Rect2(position, Vector2.ONE)
	for player in players:
		cam_rect = cam_rect.expand(player.position)
	cam_rect = cam_rect.grow_individual(margin.x, margin.y, margin.x, margin.y)
	var cam_dimension = max(cam_rect.size.x, cam_rect.size.y)
	var cam_zoom
	if cam_rect.size.x > cam_rect.size.y * screen_size.aspect():
		cam_zoom = clamp(cam_rect.size.x / screen_size.x, min_zoom, max_zoom)
	else:
		cam_zoom = clamp(cam_rect.size.y / screen_size.y, min_zoom, max_zoom)
	zoom = lerp(zoom, Vector2.ONE * cam_zoom, zoom_speed)
