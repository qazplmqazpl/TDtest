extends Control

const enemypathref = preload("res://Scenes/Main/Level/Enemypath.gd")
const myscale = Vector2(0.3,0.3)
const buttsize = Vector2(100,100)
const desiredtoweramount = 5
var currenttoweramount = 0
func _ready() -> void:
	get_viewport().size_changed.connect(resize)
	#print(get_parent().get_position())
	var butt = preload("res://Scenes/Main/UI/Towerbutton.tscn")
	
	while currenttoweramount < desiredtoweramount:
		var tower = Datatowers.towers.values().pick_random()
		var newbutt = butt.instantiate()
		#print("towermenu ",tower)
		newbutt.towername = tower.name
		newbutt.set_size(buttsize)
		#print(Callable(get_node("../../Level/Towermaplayer"),"_on_button_tower_pressed"))
		#print(get_node("../../Level/Towermaplayer"))
		var enemycost = enemypathref.createWaveStatic(Datatowers.towers[tower.name]["dangerprice"])
		newbutt.enemycost = enemycost
		newbutt.pressed.connect(Callable(get_node("../../../Level/Towermaplayer"),"_on_button_tower_pressed").bindv([tower.name,enemycost]))
		#print("Towermenu ",enemypathref.createWaveStatic(40))
		#print("towermenu",tower)
		add_child(newbutt)
		#print("!!!!!!!!",get_viewport_rect().size,get_size())
		currenttoweramount += 1

func resize():
	pass
	#set_position(Vector2((Vector2(get_viewport_rect().size)-get_size()*get_scale()).x,0))
	
