class_name Bullet extends Node2D

var direction := 0.0
var damage := 1
var speed := 1.0
var lifetime := 2
var lifetimetimer : Timer
func set_direction(mydirection = 0.0):
	direction = mydirection
	
func set_damage(mydamage = 0.0):
	damage = mydamage
	
func set_speed(myspeed = 0.0):
	speed = myspeed	

func _ready():
	
	lifetimetimer = Timer.new()
	lifetimetimer.set_wait_time(lifetime)
	lifetimetimer.timeout.connect(expired)
	lifetimetimer.set_paused(false)
	lifetimetimer.set_autostart(true)
	lifetimetimer.start()
	add_child(lifetimetimer)
	
	var collisionshape = CircleShape2D.new()
	collisionshape.set_radius(100)
	$Area2D/CollisionShape2D.set_shape(collisionshape)
	$Area2D.area_entered.connect(area_entered)
	
	#print("bulletmovin")
	
func expired():
	queue_free()
	
func _process(delta: float) -> void:
	translate(Vector2(speed,0).rotated(direction))
	#print(lifetimetimer.time_left)
	
	#print("bulletmovin")
	
func area_entered(area):
	#print("bullet area entered",area)
	if area.get_parent() is Enemy:
		area.get_parent().set_hp(area.get_parent().get_hp()-damage)
		queue_free()
	
