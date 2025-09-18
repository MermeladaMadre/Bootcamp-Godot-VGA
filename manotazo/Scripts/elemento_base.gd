extends Control

var elementoBase
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
	pass

func _cargaElementoBase():
	elementoBase = elementos.values().pick_random()
	$itmBaseSprite2D.texture = elementoBase.sprite
	
