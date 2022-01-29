extends KinematicBody


signal dying
signal dead


var velocity = Vector3.ZERO
var move_speed = 2
var flipped = false
var dead = false


onready var animated_sprite: AnimatedSprite3D = $Pivot/Sprite


func _ready():
	animated_sprite.playing = true


func _physics_process(delta):
	if dead: return
	
	# Input
	velocity.x = Input.get_action_strength("walk_right") - Input.get_action_strength("walk_left")
	velocity.z = Input.get_action_strength("walk_down") - Input.get_action_strength("walk_up")
	
	velocity = move_and_slide(velocity.normalized() * move_speed, Vector3.UP)


func _input(event):
	if dead: return
	
	var x = Input.get_action_strength("walk_right") - Input.get_action_strength("walk_left")
	var z = Input.get_action_strength("walk_down") - Input.get_action_strength("walk_up")
	
	if x != 0:
		animated_sprite.play("walk_sideways")
		
		if flipped and x > 0:
			flipped = false
			$Animator.play("flip_right")
		elif not flipped and x < 0:
			flipped = true
			$Animator.play("flip_left")
	elif z != 0:
		if z < 0:
			animated_sprite.play("walk_yonder")
		else:
			animated_sprite.play("walk_hither")
	else:
		animated_sprite.play("idle")


func kill(killer: Node = null):
	if not dead:
		dead = true
		animated_sprite.play("ded")
		emit_signal("dying", self, killer)


func _on_Sprite_animation_finished():
	if dead:
		visible = false
		emit_signal("dead", self)


func _on_DeathrayListener_deathray_entered(deathray):
	kill(deathray)
