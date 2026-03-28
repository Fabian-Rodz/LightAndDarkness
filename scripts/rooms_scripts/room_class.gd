extends Node2D

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
