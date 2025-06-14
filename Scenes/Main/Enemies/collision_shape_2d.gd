extends CollisionShape2D

func _ready():
	var shape = CircleShape2D.new()
	var rectsize = $"../../Sprite2D".get_rect().size
	shape.set_radius((rectsize.x + rectsize.y)*0.35) # niedokladne, zakladam ze teksturka bedzie pi razy drzwi kwadratowa. wolalem uniknac pierwiastkowania
	
	#var shape = RectangleShape2D.new()
	#shape.set_size($"../../Sprite2D".get_rect().size)
	
	set_shape(shape)
