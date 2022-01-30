extends Spatial

onready var player = $Player;

func _ready():
	player.connect("dead", self, "_on_player_death");
	
func _on_player_death(player):
	SceneChanger.change_scene(get_tree().current_scene.filename);
