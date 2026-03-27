# Main game test script
extends Node2D
@onready var player_1: CharacterBody2D = $Player1
@onready var player_2: CharacterBody2D = $Player2


# 0 = startup, 1 = running, 2 = hit, 3 = jump
var p1_state = 0
var p2_state = 0


func change_state_all(state:int):
	p1_state = state
	p2_state = state
	player_1.change_state(p1_state)
	player_2.change_state(p2_state)

func start_game():
	change_state_all(1)


func _ready() -> void:
	player_1.is_p1 = true
	player_1.change_sprite()
	player_2.is_p1 = false
	player_2.change_sprite()
	
	start_game()



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
