extends Camera2D

var camspeed = 10

func _ready():
#	set_position(Vector2(get_viewport().get_size()/2))
#	get_viewport().size_changed.connect(resize)
	pass

func resize():
	set_position(Vector2(get_viewport().get_size()/2))
	pass

func _process(delta):
	if Input.is_action_pressed("ui_up"):
		set_position(get_position()-Vector2(0,camspeed))
	if Input.is_action_pressed("ui_down"):
		set_position(get_position()+Vector2(0,camspeed))
	if Input.is_action_pressed("ui_left"):
		set_position(get_position()-Vector2(camspeed,0))
	if Input.is_action_pressed("ui_right"):
		set_position(get_position()+Vector2(camspeed,0))
