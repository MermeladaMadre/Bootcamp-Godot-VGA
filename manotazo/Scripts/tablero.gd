extends Control


func _on_btn_generador_test_pressed() -> void:
	_generarElementos()
	pass 
	
func _generarElementos():
	$VBoxContainer/ElementoBase._cargaElementoBase()
	for itm in get_tree().get_nodes_in_group("TopoItem"):
		itm._cargaRandomConElemento($VBoxContainer/ElementoBase.elementoBase)
