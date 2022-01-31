tool
extends AnimatedSprite3D
class_name ShadedAnimatedSprite3D


func _ready():
	connect("frame_changed", self, "_update")


func play(anim: String = ""):
	.play(anim)
	_update()


func _update():
	var frame_texture = frames.get_frame(animation, frame)
	if frame_texture == null: return
	
	var material_texture = material_override.get("albedo_texture")
	if material_texture != frame_texture:
		material_override.set("albedo_texture", frame_texture)
