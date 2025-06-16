extends Node2D

var lasthighlight : Vector2i


func _ready():
	Globals.mainNode = self
	var selectedMapScene : String
	selectedMapScene = Datalevel.maps[Globals.selected_map]["scene"]			
	print("main ",selectedMapScene)
	print("main ",$"Level/Layer0".map_to_local(get_viewport().get_mouse_position()))
func _process(delta):
#	#print(to_global($"Level/Layer0".map_to_local(get_viewport().get_mouse_position())))
#	#var localpos = $"Level/Layer0".map_to_local(get_viewport().get_mouse_position())
	if Globals.cursormode == 1:
		var currenthighlight = $"Level/Layer highlight".local_to_map($"Level/Layer highlight".get_local_mouse_position())
		if currenthighlight != lasthighlight:
			$"Level/Layer highlight".returntonormal(lasthighlight)
			$"Level/Layer highlight".highlight(currenthighlight)
		lasthighlight = currenthighlight
#	print(tilecords,get_viewport().get_mouse_position() ,$"Level/Layer0".to_local((get_viewport().get_mouse_position())))
	
