extends SpotLight


var listeners = []


func _process(delta):
	var space_state = get_world().direct_space_state
	
	for listener in listeners:
		listener = listener as DeathrayListener
		
		var local = to_local(listener.global_transform.origin)
		var angle = rad2deg(local.angle_to(Vector3.FORWARD))
		if angle > spot_angle:
			listener.outside(self)
			continue
		
		
		var hit = space_state.intersect_ray(global_transform.origin, listener.global_transform.origin, [], 0b10)
		
		if hit:
			listener.outside(self)
		else:
			listener.inside(self)


func _on_DeathArea_area_entered(area):
	if area is DeathrayListener and not listeners.has(area):
		listeners.append(area)


func _on_DeathArea_area_exited(area):
	if listeners.has(area):
		var listener = area as DeathrayListener
		listener.outside(self)
		listeners.erase(area)
