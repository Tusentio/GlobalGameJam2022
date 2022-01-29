extends Spatial

func _OpenArea_entered(body):
	$SpriteCenter/Sprite.frame = 1
	$SpriteCenter/SpriteUnlit.frame = 1

func _OpenArea_exited(body):
	$SpriteCenter/Sprite.frame = 0
	$SpriteCenter/SpriteUnlit.frame = 0
