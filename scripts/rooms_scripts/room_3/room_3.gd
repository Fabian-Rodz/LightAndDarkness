extends Room

signal shoot_light

# This function automatically connects all areas via signals to specific functions.
func _ready():
	for area in get_children():
		if area is Area2D:
			area.body_entered.connect(_on_any_area_entered.bind(area))
			area.body_exited.connect(_on_any_area_exited)
			area.action.connect(_on_area_action.bind(area))
			
func build_layer_again_2():
	$TileMap/Enviroment.set_cell(Vector2i(8, 2), 0, Vector2(1,9))
	$TileMap/Enviroment.set_cell(Vector2i(7, 2), 0, Vector2(1,9))
	
func build_layer_again_1():
	$TileMap/Enviroment.set_cell(Vector2i(-8, 2), 0, Vector2(1,9))


func _on_area_action(player: Player, area: Area2D):
	# Depending of the area, the action will change
	match area.name:
			"LightButton" : shoot_light.emit()
			"Button_2" :
				if area.revert_changes:
					build_layer_again_2()
					area.revert_changes = false
				else:
					$TileMap/Enviroment.set_cell(Vector2i(8, 2), -1)
					$TileMap/Enviroment.set_cell(Vector2i(7, 2), -1)
			"Button" :
				if area.revert_changes:
					build_layer_again_1()
					area.revert_changes = false
				else:
					$TileMap/Enviroment.set_cell(Vector2i(-8, 2), -1)
					
					
