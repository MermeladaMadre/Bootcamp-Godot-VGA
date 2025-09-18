extends Control

@export var value : String

signal btn_presionado(info)
signal btn_hover

func _ready() -> void:
	$Button.text = value
	pass
	
func _on_button_pressed() -> void:
	btn_presionado.emit(value)
	pass # Replace with function body.
	
