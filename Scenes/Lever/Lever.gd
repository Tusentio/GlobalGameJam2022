extends Area

signal switched

onready var sprite = $Sprite;
var player_in_range = false;

func _input(event):
	if Input.is_action_just_pressed("lever_switch") and player_in_range:
		sprite.frame = 1 if sprite.frame == 0 else 0
		emit_signal("switched", bool(sprite.frame));


func _on_Lever_body_entered(body):
	player_in_range = true;


func _on_Lever_body_exited(body):
	player_in_range = false;
