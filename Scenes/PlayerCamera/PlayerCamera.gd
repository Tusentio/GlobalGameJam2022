extends Spatial

export (float) var smooth_factor = 0.02;

onready var old_pos = $Camera.global_transform.origin;
onready var old_rot = Quat($Camera.global_transform.basis);

func _process(delta):
	
	var smoothage = 1 - pow(smooth_factor, delta);
	
	$Camera.global_transform.origin = old_pos.linear_interpolate(global_transform.origin, smoothage);
	old_pos = $Camera.global_transform.origin;
	
	$Camera.global_transform.basis = Basis(old_rot.slerp(global_transform.basis.get_rotation_quat(), smoothage));
	old_rot = Quat($Camera.global_transform.basis);
