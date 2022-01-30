extends AnimatedSprite3D


func _process(delta):
	var frame_texture = frames.get_frame(animation, frame)
	if frame_texture == null: return
	
	var material_texture = material_override.get("albedo_texture")
	if material_texture != frame_texture:
		material_override.set("albedo_texture", frame_texture)
