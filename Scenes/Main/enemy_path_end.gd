extends Area2D




func _on_area_entered(area: Area2D) -> void:
	if area.get_parent() is Enemy:
		#print("Enemy path end ", area.get_parent())
		area.get_parent().queue_free()
	pass # Replace with function body.
