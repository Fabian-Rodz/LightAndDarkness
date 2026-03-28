extends Node2D

@onready var players = get_node_or_null("Players")
@onready var player_1 = players.get_node_or_null("Player1")
@onready var player_2 = players.get_node_or_null("Player2")

"""
This will automatically ensure that ALL the rooms have references for each player.
"""
func set_up_all_rooms():
	for room in get_children():
		if room is Room:
			room.set_players_reference(player_1, player_2)

func _ready() -> void:
	set_up_all_rooms()
