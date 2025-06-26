extends Button

var enemycost = []
var towername := ""
var myscale := Vector2(0.20,0.20)
func _ready() -> void:
#	set_scale(myscale)
	get_button_icon().set_region(Rect2(256*Datatowers.towers[towername]["id"],0,256,384))
	var mylabelsettings = LabelSettings.new()
	#mylabelsettings.set_font_size(40)
	$Label.set_label_settings(mylabelsettings)
	$Label2.set_label_settings(mylabelsettings)
	$Label.set_text(Datatowers.towers[towername]["name"])
	$Label2.set_text(str(Datatowers.towers[towername]["price"]))
	#print("Towerbutton ", enemycost)

func _on_mouse_entered() -> void:
	for i in enemycost:
		$"../../WaveCostVisualizationControl/WaveCostVisualization"._enemy_added( i.enemyname,i.position)
		pass # Replace with function body.


func _on_mouse_exited() -> void:
	$"../../WaveCostVisualizationControl/WaveCostVisualization"._mouse_exited()
	pass # Replace with function body.
