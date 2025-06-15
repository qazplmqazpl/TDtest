extends Path2D


var timebetweenspawns = 0.2
var wavetime = 5
var currentdangerlevel := 20

signal enemyaddedsignal(enemyname, position)
signal wavesentsignal

var  time:= 0.0
var timecounter := 0
var enemyqueue := []
class enemystruct:
	var enemyname
	var position

func _draw():
	var lastpoint = get_curve().get_point_position(0)
	for i in range(get_curve().get_point_count()):
		draw_dashed_line(lastpoint,get_curve().get_point_position(i),Color(1,1,1),5)
		lastpoint=get_curve().get_point_position(i)

func _ready():
	pass
		
func _process(delta):
	pass
	#time+=delta
	#if time > timecounter:
	#	enemyqueue.append(Dataenemies.enemies.keys().pick_random())
	#	timecounter+=1
	#	
	#else:
	#	timecounter += delta
	
func sendwave():
	for i in enemyqueue:
		print(i.enemyname, i.position)
	var enemyname
	var timepassed = 0
	while true:
		var poppedenemy = enemyqueue.pop_front()
		if !poppedenemy: break
		enemyname = poppedenemy.enemyname
		var enemyScene := preload("res://Scenes/Main/Enemies/Enemy.tscn")
		var enemy = enemyScene.instantiate()
		enemy.setenemytype(enemyname)
		enemy.get_node("Sprite2D").set_texture(load(Dataenemies.enemies[enemyname]["pathtoanimation"]))
		await get_tree().create_timer(poppedenemy.position*wavetime - timepassed).timeout
		timepassed = poppedenemy.position*wavetime
		add_child(enemy)
		print("path2d sendin enemy time", timepassed )
	wavesentsignal.emit()
		
				

func add_enemycost(enemycost):
	for i in enemycost:
			enemyqueue.insert(enemyqueue.bsearch_custom(i,add_enemy_binary_search,false),i)
			enemyaddedsignal.emit(i.enemyname,i.position)
		
func _on_start_button_pressed() -> void:
	sendwave()


func add_enemy(name : String):
	print("Path2D addenemy")
	var enemy = enemystruct.new()
	enemy.enemyname = name
	enemy.position = $"../../CanvasLayer/UI/Enemy time".get_as_ratio()
	enemyqueue.insert(enemyqueue.bsearch_custom(enemy,add_enemy_binary_search,false),enemy)
	enemyaddedsignal.emit(name,enemy.position)

func add_enemy_specified_time(name : String, time : float):
	var enemy = enemystruct.new()
	enemy.enemyname = name
	enemy.position = time
	enemyqueue.insert(enemyqueue.bsearch_custom(enemy,add_enemy_binary_search,false),enemy)
	enemyaddedsignal.emit(name,enemy.position)
	
static func add_enemy_binary_search(enemystruct1,enemystruct2):
	if enemystruct1.position < enemystruct2.position:
		return true
	return false
	
func _on_warrior_button_pressed() -> void:
	add_enemy("enemy1")


func _on_pierdolec_button_pressed() -> void:
	print("Level/Path2D _on_pierdolec func activated")
	add_enemy("enemy2")

func createwave(danger: int) -> void:
	var dangerpoints = danger
	var dataenemycopy = []
	for i in Dataenemies.enemies:
		dataenemycopy.append(i)
	randomize()
	while true:
		if dangerpoints < 5: break
		var random = dataenemycopy.pick_random()
		if Dataenemies.enemies[random]["dangervalue"] > dangerpoints:
			dataenemycopy.erase(random)
		else:
			add_enemy_specified_time(random, randf())
			dangerpoints -=  Dataenemies.enemies[random]["dangervalue"]
	
static func createWaveStatic(danger: int):
	var dangerpoints = danger
	var dataenemycopy = []
	var returnedwave = []
	for i in Dataenemies.enemies:
		dataenemycopy.append(i)
	randomize()
	while true:
		if dangerpoints < 5: break
		var random = dataenemycopy.pick_random()
		if Dataenemies.enemies[random]["dangervalue"] > dangerpoints:
			dataenemycopy.erase(random)
		else:
			
			var enemy = enemystruct.new()
			enemy.enemyname = random
			enemy.position = randf()
			returnedwave.insert(returnedwave.bsearch_custom(enemy,add_enemy_binary_search,false),enemy)
			#enemyaddedsignal.emit(name,enemy.position)
			dangerpoints -=  Dataenemies.enemies[random]["dangervalue"]
	return returnedwave
			
func _on_button_create_wave_pressed() -> void:
	createwave(currentdangerlevel)
