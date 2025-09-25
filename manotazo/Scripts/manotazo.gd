extends Node2D

var gameoverTween:Tween

func _ready() -> void:
	globales.load_record()
	globales.globalScore = 0
	globales.contadorPresionados = 0	
	$Control/CenterContainer.visible = false
	
	
	pass
	
func _createGameOverPanelTween():
	if gameoverTween:
		gameoverTween.kill()
	
	gameoverTween = get_tree().create_tween()
	gameoverTween.tween_property($Control/CenterContainer, "position", Vector2(0.0,0.0),3).set_trans(Tween.TRANS_BACK).set_ease(Tween.EASE_OUT)

	gameoverTween.play()

func _on_tablero_gameover() -> void:
	$Tablero._calculaPuntos()
	$Control/CenterContainer/PanelGameOver/PanelScore/GridContainer/txtRecord.text = str(globales.record)
	$Control/CenterContainer/PanelGameOver/PanelScore/GridContainer/txtScore.text = str(globales.globalScore)
	$Control/CenterContainer.visible = true
	$Control/CenterContainer.position = Vector2(0.0,-1000.0)
	_createGameOverPanelTween()
	
	pass # Replace with function body.


func _on_btn_reiniciar_pressed() -> void:
	$Control/CenterContainer.visible = false
	$Tablero._reiniciar()
	pass # Replace with function body.
