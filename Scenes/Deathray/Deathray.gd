extends SpotLight


var listeners = []


func _process(delta):
	var space_state = get_world().direct_space_state
	
	var flag_inside = []
	var flag_outside = []
	
	for listener in listeners:
		listener = listener as DeathrayListener
		
		var local = to_local(listener.global_transform.origin)
		var angle = local.angle_to(Vector3.FORWARD)
		if angle > spot_angle:
			listener.outside(self)
			continue
		
		var hit = space_state.intersect_ray(global_transform.origin, listener.global_transform.origin)
		if hit:
			listener.inside(self)
		else:
			listener.outside(self)


func _on_DeathArea_area_entered(area):
	if area is DeathrayListener and not listeners.has(area):
		listeners.append(area)


func _on_DeathArea_area_exited(area):
	if listeners.has(area):
		listeners.erase(area)
