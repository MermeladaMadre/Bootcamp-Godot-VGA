extends Control

var score = 0
var tiempo = 10
var elementosTotales = 0

signal gameover


func _ready() -> void:
	for itm in get_tree().get_nodes_in_group("TopoItem"):
		itm.elegido.connect(_comprobarseleccion)
	pass
	

func _on_btn_generador_test_pressed() -> void:
	_generarElementos()
	
	pass 
	
func _generarElementos():
	elementosTotales = 0
	$VBoxContainer/ElementoBase._cargaElementoBase()
	for itm in get_tree().get_nodes_in_group("TopoItem"):
		itm._cargaRandomConElemento($VBoxContainer/ElementoBase.elementoBase)
		if itm.topoItem.nombre == $VBoxContainer/ElementoBase.elementoBase.nombre:
			elementosTotales += 1
	
	_validaElementosMinimos(10)
	#operación del timer
	tiempo = 10
	$VBoxContainer/HBoxContainer/TimerTextureRect2/txtTimer.text = str(tiempo)
	$Timer.start()

func _validaElementosMinimos(_minimo):
	var eNombre = $VBoxContainer/ElementoBase.elementoBase.nombre
	if elementosTotales < _minimo:
		while elementosTotales < _minimo:
			var itm = get_tree().get_nodes_in_group("TopoItem").pick_random()
			if itm.topoItem.nombre != eNombre:
				itm._cargaElemento(eNombre)
				elementosTotales += 1

func _comprobarseleccion(_IsCorrect):
	if _IsCorrect:
		score += 1
		$VBoxContainer/HBoxContainer/ScoreTextureRect/txtMarcador.text = str(score)
		if score >= elementosTotales:
			$Timer.stop()
			gameover.emit()
	else:
		$Timer.stop()
		gameover.emit()
	pass


func _reiniciar() -> void:	
	score = 0
	globales.contadorPresionados = 0
	$VBoxContainer/HBoxContainer/ScoreTextureRect/txtMarcador.text = str(score)
	_generarElementos()
	pass # Replace with function body.


func _on_timer_timeout() -> void:
	tiempo -= 1
	$VBoxContainer/HBoxContainer/TimerTextureRect2/txtTimer.text = str(tiempo)
	
	if tiempo == 0:
		$Timer.stop()
		gameover.emit()
	
	pass # Replace with function body.


func _on_btn_verificador_pressed() -> void:
	_validaElementosMinimos(10)
	pass # Replace with function body.

func _calculaPuntos():
	var mitad = elementosTotales / 2
	
	if globales.contadorPresionados >= mitad:
		globales.globalScore += (globales.contadorPresionados * 2)
		if globales.globalScore > globales.record:
			globales.record = globales.globalScore
			globales.save_record()
	else:
		globales.globalScore -= (elementosTotales - globales.contadorPresionados)
		if globales.globalScore < 0:
			globales.globalScore = 0
		
	pass
