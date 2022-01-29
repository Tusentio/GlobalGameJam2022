extends CenterContainer



func _input(event):
	if event.is_action_pressed("ui_cancel"):
		if not get_tree().get_current_scene().get_name() == "Menu":
		
			get_tree().paused = !get_tree().paused
			visible = !visible;

			$VBoxContainer/ContinueButton.grab_focus();



func _on_ContinueButton_pressed():
	get_tree().paused = false;
	visible = false;

func _on_MainMenuButton_pressed():
	get_tree().paused = false;
	SceneChanger.change_scene(SceneChanger.Scenes.MENU)
	visible = false;
