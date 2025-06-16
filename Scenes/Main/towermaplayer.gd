extends TileMapLayer

var whattowerareyoubuying := -1 # -1 means you're free to do as you wish, -2 means you're removing a tower
var whatareyoubuyingname := ""
var myenemycost = []
var clickedbutt 
func _on_button_tower_pressed(towername,enemycost,button) -> void:
	if Globals.currentgold >= Datatowers.towers[towername]["price"] and whattowerareyoubuying == -1:
		clickedbutt = button
		myenemycost = enemycost
		Globals.cursormode = 1
		Globals.currentgold-= Datatowers.towers[towername]["price"]
		$"../../CanvasLayer/UI/Labelgold".text = str(Globals.currentgold)
		whattowerareyoubuying = Datatowers.towers[towername]["id"];
		whatareyoubuyingname = towername
		print("Towermaplayer ",whattowerareyoubuying)
	
func _input(event: InputEvent):
	if Input.is_action_just_pressed("LeftClick") and whattowerareyoubuying==-2:
		set_cell(local_to_map(get_local_mouse_position()) ,-1,Vector2i(-1,-1),-1)
		whattowerareyoubuying = -1
		Globals.cursormode = 0
		print("Main/Level/Towermaplayer tilecordss ",local_to_map(get_local_mouse_position()))
	else:
		if Input.is_action_just_pressed("LeftClick") and whattowerareyoubuying!=-1:
			clickedbutt.free()
			$"../../CanvasLayer/UI/Towermenu".update()
			$"../Path2D".add_enemycost(myenemycost)
			Globals.cursormode = 0
			var tilecords = local_to_map(get_local_mouse_position())
			print("Main/Level/Towermaplayer tilecordss ",tilecords)
			set_cell(tilecords ,tile_set.get_source_id(1),Vector2i(0,0), Datatowers.towers[whatareyoubuyingname]["id"])
			whattowerareyoubuying = -1
			#var newturret = load(Datatowers.towers[whatareyoubuyingname]["scenepath"]).instantiate()
			#newturret.place(tilecords,map_to_local(tilecords))
			#add_child(newturret)
		


func _on_remove_tower_pressed() -> void:
	if whattowerareyoubuying == -1:
		Globals.cursormode = 2
		whattowerareyoubuying = -2
		
	
	pass # Replace with function body.
