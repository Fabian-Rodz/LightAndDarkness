extends CharacterBody2D


const BASE_SPEED = 800.0
const JUMP_VELOCITY = 2000
const FALL_SPEED = 5


var is_p1 

@onready var sprite
@onready var p1_sprite: Sprite2D = $Player1
@onready var p2_sprite: Sprite2D = $Player2
@onready var interactable_collision: CollisionShape2D = $InteractableArea/InteractableCollision

# Car_States
enum Player_State{
	Startup,
	Active,
	Hit,
	End_Screen
}

var current_state: Player_State = Player_State.Startup

func change_state(newState):
	current_state = newState
	match current_state:
		Player_State.Startup:
			pass
		Player_State.Active:
			pass
		Player_State.Hit:
			pass
		Player_State.End_Screen:
			pass

func change_sprite():
	if is_p1:
		sprite = p1_sprite
		p2_sprite.hide()
	else:
		sprite = p2_sprite
		p1_sprite.hide()
	sprite.show()


func _ready() -> void:
	change_state(Player_State.Active)


func _physics_process(delta: float) -> void:
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Vector2.ZERO
	
	# Set movement controls if player is p1 or p2
	if is_p1:
		direction.x = Input.get_axis("p1_left", "p1_right")
	else:
		direction.x = Input.get_axis("p2_left", "p2_right")
	
	# Gravity
	if not is_on_floor():
		velocity += get_gravity() * delta * FALL_SPEED
		
	# State handling
	match current_state:
		Player_State.Startup:
			pass

		Player_State.Active:
			if (Input.is_action_just_pressed("p1_up") and is_on_floor() and is_p1) or (Input.is_action_just_pressed("p2_up") and is_on_floor() and not is_p1):
				velocity.y = -JUMP_VELOCITY 
			velocity.x = move_toward(velocity.x,direction.x * BASE_SPEED, 10000 * delta)

		Player_State.Hit:
			pass
		
		Player_State.End_Screen:
			pass
	
	move_and_slide()


#func _on_car_area_area_entered(area: Area2D) -> void:
	#if "Food" in area.name:
		#points += 1
		#print("Points: " + str(points))
	#print("Collision")
