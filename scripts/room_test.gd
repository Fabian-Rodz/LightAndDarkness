extends Node2D

@onready var player_1 = $Players/Player1
@onready var player_2 = $Players/Player2


func _on_area_2d_body_entered(body: Player) -> void:
	if body == player_1:
		print("Player 1 Entered")
