extends Button
func _ready():
	set_text("start")
	pressed.connect($Level/Path2D.sendwave())
