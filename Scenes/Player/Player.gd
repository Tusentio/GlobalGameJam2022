extends KinematicBody

var velocity = Vector3.ZERO
var move_speed = 2
var flipped = false
var isRunning = false

func _physics_process(delta):
	# Input
	velocity.x = Input.get_action_strength("walk_right") - Input.get_action_strength("walk_left")
	velocity.z = Input.get_action_strength("walk_down") - Input.get_action_strength("walk_up")

	velocity = move_and_slide(velocity.normalized() * move_speed, Vector3.UP)

func _input(event):
	var facing = Input.get_action_strength("walk_right") - Input.get_action_strength("walk_left")

	if facing != 0:
		if not isRunning:
			isRunning = true
			$Pivot/Sprite.visible = false
			$Pivot/Running.visible = true
			$Pivot/Running.frame = 0
			$Pivot/Running.playing = true
		
		if flipped and facing > 0:
			flipped = false
			$Animator.play("flip_right")
		elif not flipped and facing < 0:
			flipped = true
			$Animator.play("flip_left")
	elif isRunning:
		isRunning = false
		$Pivot/Sprite.visible = true
		$Pivot/Running.visible = false
