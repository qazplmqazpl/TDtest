class_name Enemy extends PathFollow2D

var enemyname := ""
var hp := 5
var speed := 5
var armor := 5

func set_hp(setval):
	hp = setval
	if hp<=0:
		queue_free()
	$Labelhp.set_text(str(hp))
	
func get_hp():
	return hp
	
func _process(delta):
	set_progress(get_progress()+speed)
	if progress_ratio == 1:
		queue_free()
	
func setenemytype(type):
	enemyname = Dataenemies.enemies[type]["name"]
	hp = Dataenemies.enemies[type]["hp"]
	speed = Dataenemies.enemies[type]["speed"]
	$Labelhp.set_text(str(hp))
	armor = Dataenemies.enemies[type]["armor"]
