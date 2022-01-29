extends Spatial

func _OpenArea_entered(body):
	$Animator.play("shake")
	$SpriteCenter/Sprite.frame = 1

func _OpenArea_exited(body):
	$Animator.play("shake")
	$SpriteCenter/Sprite.frame = 0
