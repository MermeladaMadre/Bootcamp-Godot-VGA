extends Node2D

var IsDragging = false

func _ready() -> void:
	#$coco.scale = Vector2(0,0)
	#$coco.modulate = Color.TRANSPARENT
	pass
	


func _animaAlCoco():
	var cocoTween = get_tree().create_tween().set_loops()
	#cocoTween.tween_property($coco,"scale", Vector2(3.0,3.0),3.0).set_ease(Tween.EASE_OUT_IN).set_trans(Tween.TRANS_EXPO)
	cocoTween.tween_property($coco,"modulate", Color.RED,2.0)
	cocoTween.set_ease(Tween.EASE_OUT)
	cocoTween.set_trans(Tween.TRANS_EXPO)
	cocoTween.tween_callback(_cocoTransparente)
	
	
	cocoTween.play()
	
func _cocoTransparente():
		$coco.modulate = Color.TRANSPARENT
	
func _on_texture_button_pressed() -> void:
	#$coco.scale = Vector2(0,0)
	$coco.modulate = Color.WHITE
	_animaAlCoco()
	pass # Replace with function body.



func _on_texture_button_mouse_entered() -> void:
	IsDragging = true
	
	
	pass # Replace with function body.


func _on_texture_button_button_down() -> void:
	#if IsDragging:
			#
		#var nX = Input.mouse.x 
		#var nY = Input.mouse.y
		#
		#$TextureButton.position = Vector2(nX,nY)
	pass # Replace with function body.


func _on_texture_button_button_up() -> void:
	IsDragging = false
	pass # Replace with function body.
