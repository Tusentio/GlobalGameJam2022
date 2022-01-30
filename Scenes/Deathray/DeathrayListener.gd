extends Area
class_name DeathrayListener


signal deathray_entered
signal deathray_exited


var deathrays = []


func inside(deathray):
	if not deathrays.has(deathray):
		deathrays.append(deathray)
		emit_signal("deathray_entered", deathray)


func outside(deathray):
	if deathrays.has(deathray):
		deathrays.erase(deathray)
		emit_signal("deathray_exited", deathray)

