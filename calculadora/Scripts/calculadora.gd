extends Node2D

#var operador
var operando1
var operando2
var resultado


func _on_btn_calcular_pressed() -> void:
	
	operando1 = float($TxtOperando1.text)
	operando2 = float($TxtOperando2.text)

	resultado = operando1 + operando2
	
	$LblResultado.text = str(resultado)
	
	pass # Replace with function body.
