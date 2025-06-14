extends Node2D


func _enemy_added(enemyname: String, position: float) -> void:
	var nowysprite = Sprite2D.new()
	nowysprite.set_texture(load(Dataenemies.enemies[enemyname]["pathtoanimation"]))
	nowysprite.set_position(Vector2(0, (position*($StraightLine.get_texture().get_height())*($StraightLine.get_scale().y))))
	#print("Wavevisual ",$StraightLine.get_position())
	add_child(nowysprite)
	#print(enemyname)
	#queue_redraw() 
	
func _wave_sent():
	for i in get_children():
		if i != $StraightLine:
			i.queue_free()
			
