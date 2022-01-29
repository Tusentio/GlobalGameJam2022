extends Control

func _ready():
	$CenterContainer/Buttons/PlayButton.grab_focus();


func _PlayButton_pressed():
	SceneChanger.change_scene(SceneChanger.get_level(1))
	
func _on_QuitButton_pressed():
	get_tree().quit()
