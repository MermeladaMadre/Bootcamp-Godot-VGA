extends Control

@export var simbolo : String
@export var imagen : Texture2D

signal presionado(_simbolo)

func _ready() -> void:
	$btnTecla.text = simbolo
	$btnTecla/ImagenSprite2D.texture = imagen
	
	pass

func _on_btn_tecla_pressed() -> void:
	presionado.emit(simbolo)
	pass # Replace with function body.
	
