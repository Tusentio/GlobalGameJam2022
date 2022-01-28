extends KinematicBody

var velocity = Vector3.ZERO;
var move_speed = 2;
var flipped = false;

func _physics_process(delta):
	# Input
	velocity.x = Input.get_action_strength("walk_right") - Input.get_action_strength("walk_left");	
	velocity.z = Input.get_action_strength("walk_down") - Input.get_action_strength("walk_up");
	
	# Animation
	if velocity.x < 0 and not flipped:
		flipped = true;
		$Animator.play("flip_left");
	elif velocity.x > 0 and flipped:
		flipped = false;
		$Animator.play("flip_right");
	
	velocity = move_and_slide(velocity.normalized() * move_speed, Vector3.UP);
