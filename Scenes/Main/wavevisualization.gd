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
	var oldpos = $StraightLine/WaveCursor.get_position()
	for timepassed in range(0,100,1):
		var timepassedfloat = float(timepassed)/100.0
		await get_tree().create_timer(0.01).timeout # range(start,end,jump) await jump/100
		$StraightLine/WaveCursor.set_position(oldpos+Vector2(0,timepassedfloat*($StraightLine.get_texture().get_height())*($StraightLine.get_scale().y)))
	for i in get_children():
		if i != $StraightLine:
			i.queue_free()
	$StraightLine/WaveCursor.set_position(oldpos)

func _mouse_exited():
	for i in get_children():
		if i != $StraightLine:
			i.queue_free()
	
			
