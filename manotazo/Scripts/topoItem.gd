extends Control

var topoItem
var elementoActivo
var elementos = {
	"milk": {
		"nombre": "milk",
		"sprite": preload("res://imagenes/personajes/leche.png"),
		"activo": true
	},
	"apple": {
		"nombre": "apple",
		"sprite": preload("res://imagenes/personajes/manzana.png"),
		"activo": true
	},
	"orange": {
		"nombre": "orange",
		"sprite": preload("res://imagenes/personajes/naranja.png"),
		"activo": true
	},
	"bread": {
		"nombre": "bread",
		"sprite": preload("res://imagenes/personajes/pan.png"),
		"activo": true
	},
	"lettuce": {
		"nombre": "lettuce",
		"sprite": preload("res://imagenes/personajes/lechuga.png"),
		"activo": true
	},
	"coconut": {
		"nombre": "coconut",
		"sprite": preload("res://imagenes/personajes/coco.png"),
		"activo": true
	},
	"ice": {
		"nombre": "ice",
		"sprite": preload("res://imagenes/personajes/mora.png"),
		"activo": true
	}
}

func _ready() -> void:
	#Prueba de carga
	#_cargaElementoBase()
	$errorSprite.visible = false
	pass
	
func _reiniciar():
	$btnTopo.button_pressed = false
	$errorSprite.visible = false
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
	
	topoItem = elementos.find_key(_elemento)
	$btnTopo.icon = topoItem.sprite
	#$btnTopo/topoSprite2D.texture = topoItem.sprite
	
func _on_btn_topo_pressed() -> void:
	if elementoActivo.nombre != topoItem.nombre:
		$errorSprite.visible = true
	
	
	pass # Replace with function body.
