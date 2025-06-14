extends Node

func wait(sec: float) -> void:
	await get_tree().create_timer(sec).timeout
