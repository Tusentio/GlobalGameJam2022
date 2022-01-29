extends KinematicBody


var velocity = Vector3.ZERO
var move_speed = 2
var flipped = false


onready var animated_sprite: AnimatedSprite3D = $Pivot/Sprite


func _ready():
	animated_sprite.playing = true


func _physics_process(delta):
	# Input
	velocity.x = Input.get_action_strength("walk_right") - Input.get_action_strength("walk_left")
	velocity.z = Input.get_action_strength("walk_down") - Input.get_action_strength("walk_up")
	
	velocity = move_and_slide(velocity.normalized() * move_speed, Vector3.UP)


func _process(delta):
	if velocity.x != 0:
		if flipped and velocity.x > 0:
			flipped = false
			$Animator.play("flip_right")
			animated_sprite.play("walk_sideways")
		elif not flipped and velocity.x < 0:
			flipped = true
			$Animator.play("flip_left")
			animated_sprite.play("walk_sideways")
	elif velocity.z != 0:
		if velocity.z < 0:
			animated_sprite.play("walk_yonder")
		else:
			animated_sprite.play("walk_hither")
	else:
		animated_sprite.play("idle")
