extends Spatial

onready var sprite = $Sprite;

signal switched

func _input(event):
	if Input.is_action_just_pressed("lever_switch"):
		sprite.frame = 1 if sprite.frame == 0 else 0
		emit_signal("switched", bool(sprite.frame));
