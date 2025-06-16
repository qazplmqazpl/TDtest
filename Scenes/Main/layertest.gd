extends TileMapLayer

var lasthighlight : Vector2
var currenthighlight : Vector2
func _process(delta):
	currenthighlight = local_to_map(get_local_mouse_position())
	if currenthighlight != lasthighlight:
		returntonormal(lasthighlight)
		highlight(currenthighlight)
	lasthighlight = currenthighlight
	#print(to_global($"Level/Layer0".map_to_local(get_viewport().get_mouse_position())))
	#var localpos = $"Level/Layer0".map_to_local(get_viewport().get_mouse_position())
	#var tilecords = local_to_map(get_viewport().get_mouse_position())
	#print(tilecords,get_viewport().get_mouse_position() ,to_local((get_viewport().get_mouse_position())))

#func _unhandled_input(event: InputEvent):
	#if Input.is_action_just_pressed("LeftClick"):
		#print((tile_set.get_source(tile_set.get_source_id(0))).get_tiles_count())
		#var tilecords = local_to_map(to_local((get_viewport().get_mouse_position())))
		#set_cell(tilecords ,tile_set.get_source_id(0),Vector2i(get_cell_atlas_coords(tilecords).x,0), 0)
	#if Input.is_action_just_pressed("RightClick"):
		#var tilecords = local_to_map(to_local(get_viewport().get_mouse_position()))
		#
		#set_cell(tilecords ,tile_set.get_source_id(0),Vector2i(get_cell_atlas_coords(tilecords).x,1), 0)
		#
func highlight(pos : Vector2):
	set_cell(pos ,tile_set.get_source_id(0),Vector2i(Globals.cursormode,0), 0)
func returntonormal(pos : Vector2):
	set_cell(pos ,tile_set.get_source_id(-1),Vector2i(-1,-1), -1)
