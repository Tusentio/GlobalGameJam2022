extends Spatial

func _OpenArea_entered(body):
	set_coffin_open(true);

func _OpenArea_exited(body):
	set_coffin_open(false);

func _ExitArea_body_entered(body):
	body.disable();
	set_coffin_open(false);
	
func set_coffin_open(is_coffin_open):
	$SpriteCenter/Sprite.frame = int(is_coffin_open)
	$SpriteCenter/SpriteUnlit.frame = int(is_coffin_open)
	$CoffinSound.play()
