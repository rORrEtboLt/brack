extends CharacterBody2D


const SPEED = 300.0

@onready var PlayerAnimation = $AnimatedSprite2D
var facing = "down"

func _physics_process(_delta: float) -> void:
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity = direction * SPEED
	
	if direction != Vector2.ZERO:
		if abs(direction.x) > abs(direction.y):
			facing = "left" if direction.x < 0 else "right"
		else:
			facing = "up" if direction.y < 0 else "down"
		PlayerAnimation.play("walk_" + facing)
	else:
		PlayerAnimation.play("idle_" + facing)

	move_and_slide()
