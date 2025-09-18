extends Node2D

var valores = ""
var operandoA = null
var operandoB = null
var operador = null
var resultado = null
var bNuevoValor = false


func _ready() -> void:
	for itm in get_tree().get_nodes_in_group("Tecla"):
		itm.btn_presionado.connect(_btn_presionado)
	pass
	
func add_info(info:String):
	
	match info:
		"Borrar":
			valores = borrar(valores)
		"C":
			valores = ""
			operador = null
			operandoA = null
			operandoB = null
			resultado = null
			$Panel/VBoxContainer/lblOperacion.text = ""
		"=":
			valores = calcular()
			$Panel/VBoxContainer/lblOperacion.text = valores
		"+":
			operador = "+"
			pre_operacion(info)
		"-":
			operador = "-"
			pre_operacion(info)
		"X":
			operador = "*"
			pre_operacion(info)
		"/":
			operador = "/"
			pre_operacion(info)
		_:
			if bNuevoValor:
				valores = ""
				bNuevoValor = false
				
			valores = valores + info
	
	$Panel/VBoxContainer/LineEditPantalla.text = valores
	pass
	
func _btn_presionado(info):
	add_info(info)
	pass

func borrar(_info: String) -> String:
	var n_info = _info.substr(0,_info.length() - 1)
	return n_info

func pre_operacion(info):

	operandoA = float(valores)
	operador = info
	bNuevoValor = true
	
	$Panel/VBoxContainer/lblOperacion.text = valores + info
	
func calcular()->String:
	operandoB = float(valores)
	match operador:
		"+": 
			resultado = operandoA + operandoB
		"-": 
			resultado = operandoA - operandoB
		"X": 
			resultado = operandoA * operandoB
		"/": 
			resultado = operandoA / operandoB
		
	operandoA = resultado
	return str(resultado)
	

	
