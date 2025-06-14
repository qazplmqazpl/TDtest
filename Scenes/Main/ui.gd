extends ReferenceRect

func _ready():
	set_size(get_viewport().get_size())
	get_viewport().size_changed.connect(resize)
	resize()
	pass

func resize():
	set_size(get_viewport().get_size())
	set_position(Vector2(0,0))
	print("ui ",size, get_viewport_rect().size)
