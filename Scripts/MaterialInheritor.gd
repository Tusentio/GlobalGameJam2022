tool
extends GeometryInstance

export (Material) var base_material: Material setget _set_base_material
export (Dictionary) var property_overrides: Dictionary setget _set_property_overrides


func _ready():
	_update()


func _set_base_material(value: Material):
	base_material = value
	_update()


func _set_property_overrides(value: Dictionary):
	property_overrides = value
	_update()


func _update():
	if not base_material: return
	material_override = base_material.duplicate()
	for p in property_overrides.keys():
		material_override.set(p, property_overrides.get(p))
	
