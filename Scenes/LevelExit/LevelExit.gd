extends Spatial

func _OpenArea_entered(body):
	$Animator.play("shake")
	$Sprite.frame = 1

func _OpenArea_exited(body):
	$Animator.play("shake")
	$Sprite.frame = 0
