class_name TurretAbstract extends Node2D

#var rangecollisionshape = CollisionShape2D.new()
#var rangearea = Area2D.new()
var coords := Vector2i(0,0)
var pos := Vector2(0,0)
@export_group("turret")
@export var turretname := ""
@export var turretrange := 100
@export var damage := 1
@export var projectilespeed := 10
var enemies := []
@export var cooldowntime := 1.0
var cooldowntimer = Timer.new()
#var turretlabel = Label.new()

#func _init(myrange = 100, myname = "initdebugname", mycoords = Vector2i(0,0), mypos = Vector2(0,0), mydamage = 1, mycooldown = #1.0, myprojectilespeed = 10):
#	turretrange = myrange
#	name = myname
#	pos = mypos
#	coords = mycoords
#	damage = mydamage
#	projectilespeed = myprojectilespeed
#	cooldowntimer.set_wait_time(mycooldown)
#	cooldowntimer.timeout.connect(attack)
#	cooldowntimer.set_paused(false)
#	cooldowntimer.set_autostart(true)
#	cooldowntimer.set_one_shot(true)
	
func _ready():
	#rangeshape.set_radius(turretrange)
	#rangecollisionshape.set_shape(rangeshape)
	#rangearea.add_child(rangecollisionshape)
	$"AreaRange".area_entered.connect(area_entered_tower)
	$"AreaRange".area_exited.connect(area_exited_tower)
	#add_child(rangearea)
	add_child(cooldowntimer)
	cooldowntimer.start()
	#print("turretready")
	pass

func _process(_delta: float) -> void:
	pass
	#turretlabel.set_text(str(cooldowntimer.get_time_left()))
	#print(str(cooldowntimer.get_time_left()))
	
func attack():
	#print("attack",enemies)
	if not enemies.is_empty():
		#print("attacking ",enemies)
		
		var bull = preload("res://Scenes/Main/Turrets/bulletbasic.tscn")
		var newbull = bull.instantiate()
		newbull.set_damage(damage)
		newbull.set_speed(projectilespeed)
		newbull.set_direction(get_global_position().angle_to_point(enemies[0].get_global_position()))
#print(get_global_position(),enemies[0].get_global_position(),get_global_position().angle_to(enemies[0].get_global_position()))
		add_child(newbull)
		#enemies[0].set_hp(enemies[0].get_hp()-damage)
		cooldowntimer.start()
		#cooldowntimer.set_paused(false)
		#print(cooldowntimer.get_wait_time(),cooldowntimer,cooldowntimer.is_stopped())
	
func upgrade():
	pass

func place(mycoords: Vector2i , mypos : Vector2):
	global_position = mypos
	coords = mycoords
	pos = mypos
	
func area_entered_tower(area):
	if area.get_parent() is Enemy:
		#print("area entered tower",enemies,cooldowntimer.is_stopped(),cooldowntimer.get_wait_time())
		enemies.append(area.get_parent())
		if cooldowntimer.is_stopped():
			attack()
		
func area_exited_tower(area):
	if area.get_parent() is Enemy:
		enemies.erase(area.get_parent())
		#print("area exited tower",enemies)
	
