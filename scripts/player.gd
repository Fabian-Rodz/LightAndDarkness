extends CharacterBody2D
class_name Player

const BASE_SPEED = 800.0
const JUMP_VELOCITY = 2000
const FALL_SPEED = 5

# with this will be able to control the name of the inputs
var input_name

@onready var interactable_collision: CollisionShape2D = $InteractableArea/InteractableCollision
@export var test = "Test"
enum Player_State{
	Startup,
	Active,
	End_Screen
}

var current_state: Player_State = Player_State.Startup

func setup():
	if name == "Player1":
		input_name = "p1_"
	else:
		input_name = "p2_"

func change_state(newState):
	current_state = newState
	match current_state:
		Player_State.Startup:
			pass
		Player_State.Active:
			pass
		Player_State.End_Screen:
			pass

func _ready() -> void:
	setup()
	change_state(Player_State.Active)


func _physics_process(delta: float) -> void:
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Vector2.ZERO
	
	# Set movement controls if player is p1 or p2
	direction.x = Input.get_axis(input_name + "left", input_name + "right")
	
	# Gravity
	if not is_on_floor():
		velocity += get_gravity() * delta * FALL_SPEED
		
	# State handling
	match current_state:
		Player_State.Startup:
			pass

		Player_State.Active:
			if Input.is_action_just_pressed(input_name + "up") and is_on_floor():
				velocity.y = -JUMP_VELOCITY 
			velocity.x = move_toward(velocity.x,direction.x * BASE_SPEED, 10000 * delta)
		
		Player_State.End_Screen:
			pass
	move_and_slide()
