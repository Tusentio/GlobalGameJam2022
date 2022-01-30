extends Area

signal switched

export (bool) var on = false

onready var sprite = $Sprite;
var player_in_range = false;


func _process(event):
	sprite.frame = int(on)


func _input(event):
	if Input.is_action_just_pressed("lever_switch") and player_in_range:
		on = not on
		emit_signal("switched", on);


func _on_Lever_body_entered(body):
	player_in_range = true;


func _on_Lever_body_exited(body):
	player_in_range = false;
