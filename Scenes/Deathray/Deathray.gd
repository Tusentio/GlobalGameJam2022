extends SpotLight


export (NodePath) var switch: NodePath = ""
export (bool) var on = true


var listeners = []
onready var _on = on


func _ready():
	if switch:
		var switch_node = get_node(switch)
		
		if switch_node and switch_node.has_signal("switched"):
			switch_node.connect("switched", self, "_on_Switch_switched")


func _process(delta):
	if on != _on:
		turn_off() if on else turn_on()
		_on = on
	
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


func turn_off():
	if on:
		on = false
		_on = false


func turn_on():
	if not on:
		on = true
		_on = true


func _on_DeathArea_area_entered(area):
	if area is DeathrayListener and not listeners.has(area):
		listeners.append(area)


func _on_DeathArea_area_exited(area):
	if listeners.has(area):
		var listener = area as DeathrayListener
		listener.outside(self)
		listeners.erase(area)


func _on_Switch_switched(state):
	turn_on() if state else turn_off()
