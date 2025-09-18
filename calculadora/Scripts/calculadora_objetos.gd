extends Node2D

var valores:String = ""
var val1:float = 0.0
var val2:float = 0.0
var operador:String
var cargado:bool = false

func _ready() -> void:
	for itm in get_tree().get_nodes_in_group("MiBoton"):
		itm.presionado.connect(_presionado)
		
func _presionado(_info):
	if _info == "C":
		_borrar(true)
	elif _info == "DEL":
		valores = valores.substr(0,valores.length() - 1)
		$PanelCalculadora/VBoxContainer/LineEdit.text = valores
	elif _info == "+" || _info == "-" || _info == "*" || _info == "/":
		_preoperacion(_info)
	elif _info == "=":
		valores = str(_resultado())
		$PanelCalculadora/VBoxContainer/LineEdit.text = valores
		$PanelCalculadora/VBoxContainer/LineEditTemp.text = ""
		val1 = 0
		val2 = 0
		operador = ""
	elif _info == "-/+":
		if valores.substr(0,1) == "-":
			valores = valores.substr(1,valores.length())
		else:
			valores = "-" + valores
		
		$PanelCalculadora/VBoxContainer/LineEdit.text = valores
	else:
		agregar_valor(_info)
	pass
	
func agregar_valor(_nValor:String):
	if cargado:
		_borrar(false)
		cargado = false
		
	valores += _nValor
	$PanelCalculadora/VBoxContainer/LineEdit.text = valores
	
	pass
	
func _borrar(_todo:bool):
	# borrado de pantalla
	if(_todo):
		$PanelCalculadora/VBoxContainer/LineEditTemp.text = ""
		val1 = 0
		val2 = 0
		operador = ""
		
	valores = ""
	$PanelCalculadora/VBoxContainer/LineEdit.text = valores
	pass

func _preoperacion(_operador:String):
	if(val1 != 0):
		val1 = _resultado()
	else:
		val1 = float(valores)
	
	operador = _operador
	cargado = true
	$PanelCalculadora/VBoxContainer/LineEditTemp.text = str(val1)+_operador
	
	pass

	
func _resultado() -> float:
	var resultado = 0
	val2 = float(valores)
	
	match(operador):
		"+": 
			resultado = val1 + val2
		"-": 
			resultado = val1 - val2
		"*": 
			resultado = val1 * val2
		"/": 
			if(val1 != 0):
				resultado = val1 / val2
			else:
				$PanelCalculadora/VBoxContainer/LineEdit.text = "ERROR"
		"%": 
			resultado = val1 * val2/100
		
			
	valores = str(resultado)
	$PanelCalculadora/VBoxContainer/LineEdit.text = valores
	
	return resultado
	
	
