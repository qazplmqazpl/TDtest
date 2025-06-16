extends TurretAbstract

func _ready():
	$AreaRange/CollisionShape2D.get_shape().set_radius(turretrange)
