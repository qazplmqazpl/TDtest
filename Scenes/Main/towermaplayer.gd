extends TileMapLayer

var whattowerareyoubuying := -1 
var whatareyoubuyingname := ""
var myenemycost = []
func _on_button_tower_pressed(towername,enemycost) -> void:
	if Globals.currentgold >= Datatowers.towers[towername]["price"] and whattowerareyoubuying == -1:
		myenemycost = enemycost
		Globals.cursormode = 1
		Globals.currentgold-= Datatowers.towers[towername]["price"]
		$"../../CanvasLayer/UI/Labelgold".text = str(Globals.currentgold)
		whattowerareyoubuying = Datatowers.towers[towername]["id"];
		whatareyoubuyingname = towername
		print("Towermaplayer ",whattowerareyoubuying)
	
func _input(event: InputEvent):
	if Input.is_action_just_pressed("LeftClick") and whattowerareyoubuying!=-1:
		$"../Path2D".add_enemycost(myenemycost)
		Globals.cursormode = 0
		var tilecords = local_to_map(get_local_mouse_position())
		print("Main/Level/Towermaplayer tilecordss ",tilecords)
		set_cell(tilecords ,tile_set.get_source_id(0),Vector2i(whattowerareyoubuying,0), 0)
		whattowerareyoubuying = -1
		var newturret = TurretAbstract.new(Datatowers.towers[whatareyoubuyingname]["range"],whatareyoubuyingname,tilecords,map_to_local(tilecords),Datatowers.towers[whatareyoubuyingname]["damage"],Datatowers.towers[whatareyoubuyingname]["cooldown"],Datatowers.towers[whatareyoubuyingname]["projectilespeed"])
		newturret.place(tilecords,map_to_local(tilecords))
		add_child(newturret)
		
