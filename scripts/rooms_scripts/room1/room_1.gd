extends Room


func _process(_delta: float) -> void:
	pass

# This function automatically connects all areas via signals to specific functions.
func _ready():
	for area in get_children():
		if area is Area2D:
			area.body_entered.connect(_on_any_area_entered.bind(area))
			area.body_exited.connect(_on_any_area_exited)
			area.action.connect(_on_area_action.bind(area))
