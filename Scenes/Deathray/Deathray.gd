extends SpotLight


export (NodePath) var switch: NodePath = ""


var listeners = []


func _ready():
	if switch:
		var switch_node = get_node(switch)
		
		if switch_node and switch_node.has_signal("switched"):
			switch_node.connect("switched", self, "_on_Switch_switched")


func _process(delta):	
	if not visible: return
	
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


func _on_Switch_switched(state):
	$On.play() if state else $Off.play()
	visible = state
