extends Node2D

"""
Notes :
	TileMap Scale = 10
	Text size = 100
"""

class_name Room
"""
This node will be the superclass for ALL rooms.
Each room must have a reference to each Player in a variable.
This is important because each room will manage the player differently,
using different nodes, logic, and Area2D scenarios.

"""

@onready var player_1 : Player
@onready var player_2  : Player

# this functions is used in game_manager.gd
func set_players_reference(p1 : Player, p2 : Player):
	player_1 = p1
	player_2 = p2


func _process(_delta: float) -> void:
	pass

"""
This should implement connecting all the area signals.
This is implemented in a room scene that inherits from
this script. If you want more information, look in the
room scripts folder.
"""
func _ready():
	pass

# ---------------- Area Handle ---------------------
func _on_any_area_entered(body: Node2D, area: Area2D):
	if body is Player:
		body.current_area = area

func _on_any_area_exited(body: Node2D):
	if body is Player:
		body.current_area = null

#this is just an example
func _on_area_action(player: Player, area: Area2D):
	# Depending of the area, the action will change
	match area.name:
		"Area2D":  print(player.name + ": lever pulled")
		"Area2D2": print(player.name + ": chest opened")
		_:         print(player.name + " interacted with " + area.name)
