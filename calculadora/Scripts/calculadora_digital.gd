extends Node2D

var valores = ""

func add_info(info:String):
	valores = valores + info
	$Panel/VBoxContainer/LineEditPantalla.text = valores	
	pass
	
func _on_btn_0_pressed() -> void:
	add_info("0")
	pass # Replace with function body.

func _on_btn_1_pressed() -> void:
	add_info("1")
	pass # Replace with function body.

func _on_btn_2_pressed() -> void:
	add_info("2")
	pass # Replace with function body.

func _on_btn_3_pressed() -> void:
	add_info("3")
	pass # Replace with function body.

func _on_btn_delete_pressed() -> void:
	var n_valores = ""
	n_valores = valores.substr(0,valores.length() - 1)
	valores = ""
	add_info(n_valores)
	pass # Replace with function body.
