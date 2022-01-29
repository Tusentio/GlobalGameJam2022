extends Spatial

func _OpenArea_entered(body):
	$Animator.play("shake")
	$SpriteCenter/Sprite.frame = 1
	$SpriteCenter/SpriteUnlit.frame = 1
