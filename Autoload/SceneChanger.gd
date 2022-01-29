extends CanvasLayer

var is_changing = false;

const Scenes = {
	"MENU": "res://Scenes/Menu/Menu.tscn",
	"END": "res://Scenes/End/End.tscn"
}

func get_level(level: int):
	return "res://Scenes/Levels/Level" + String(level) + "/Level" + String(level) + ".tscn";

func change_scene(scene):
	if is_changing: return;
	
	is_changing = true;
	get_tree().get_root().set_disable_input(true);
	
	# Fade to black
	$Animator.play("fade");
	yield($Animator, "animation_finished");
	
	# Change scene
	get_tree().change_scene(scene);
	
	# Fade from black
	$Animator.play_backwards("fade");
	
	is_changing = false;
	get_tree().get_root().set_disable_input(false);

