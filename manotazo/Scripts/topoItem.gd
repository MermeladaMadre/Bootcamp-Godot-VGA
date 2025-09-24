extends Control

var topoItem
var elementoActivo
var elementos = {
	"milk": {
		"nombre": "milk",
		"sprite": preload("res://imagenes/personajes/leche.png"),
		"sound": preload("res://SFX/kk attack.mp3"),
		"activo": true
	},
	"apple": {
		"nombre": "apple",
		"sprite": preload("res://imagenes/personajes/manzana.png"),
		"sound": preload("res://SFX/kk ive fought children tougher than you.mp3"),
		"activo": true
	},
	"orange": {
		"nombre": "orange",
		"sprite": preload("res://imagenes/personajes/naranja.png"),
		"sound": preload("res://SFX/kk surprise surprise.mp3"),
		"activo": true
	},
	"bread": {
		"nombre": "bread",
		"sprite": preload("res://imagenes/personajes/pan.png"),
		"sound": preload("res://SFX/nothing here.mp3"),
		"activo": true
	},
	"lettuce": {
		"nombre": "lettuce",
		"sprite": preload("res://imagenes/personajes/lechuga.png"),
		"sound": preload("res://SFX/run.mp3"),
		"activo": true
	},
	"coconut": {
		"nombre": "coconut",
		"sprite": preload("res://imagenes/personajes/coco.png"),
		"sound": preload("res://SFX/where am i.mp3"),
		"activo": true
	},
	"ice": {
		"nombre": "ice",
		"sprite": preload("res://imagenes/personajes/mora.png"),
		"sound": preload("res://SFX/you shot me.mp3"),
		"activo": true
	}
}
var presionado = false
signal elegido(_IsCorrect)

func _ready() -> void:
	#Prueba de carga
	#_cargaRandom()
	#for itm in elementos.values():
		#var n = itm.nombre
		#_cargaElemento(n)
	$errorSprite.visible = false
	
	pass
	
func _reiniciar():
	$btnTopo.button_pressed = false
	$errorSprite.visible = false
	presionado = false
	pass
	
func _cargaRandom():
	_reiniciar()
	topoItem = elementos.values().pick_random()
	$btnTopo.icon = topoItem.sprite
	pass
	
func _cargaRandomConElemento(_elemento):
	elementoActivo = _elemento
	_cargaRandom()
	pass


func _cargaElemento(_elemento):
	topoItem = elementos.get(_elemento)
	$btnTopo.icon = topoItem.sprite
	pass
	
func _on_btn_topo_pressed() -> void:
	if elementoActivo.nombre != topoItem.nombre:
		$errorSprite.visible = true
		$AudioStreamPlayer2D.stream = preload("res://SFX/Round_End.wav")
		elegido.emit(false)
		pass
	else:
		presionado = true
		globales.contadorPresionados += 1
		$AudioStreamPlayer2D.stream = topoItem.sound
		elegido.emit(true)
	
	$AudioStreamPlayer2D.play()
	
	
	pass # Replace with function body.
