extends Button

@export var value : String

signal btn_presionado(info)


func _on_pressed() -> void:
	emit_signal("btn_presionado",value)
	
	pass # Replace with function body.
