extends Node

const towers := {
	"tower1" : {
		"name" : "tower1",
		"price" : 200,
		"dangerprice" : 20,
		"id" : 1,
		"range" : 1000,
		"speed" : 10.0,
		"damage" : 2,
		"projectilespeed" : 20,
		"cooldown" : 1.5,
		"atlascoords" : Vector2i(0,1),
		"scenepath" : "res://Scenes/Main/Turrets/Turret1/turret1.tscn"
	},
	"tower2" : {
		"name" : "tower2",
		"price" : 100,
		"dangerprice" : 10,
		"id" : 2,
		"range" : 500,
		"speed" : 10.0,
		"damage" : 2,
		"projectilespeed" : 60,
		"cooldown" : 0.5,
		"atlascoords" : Vector2i(0,2),
		"scenepath" : "res://Scenes/Main/Turrets/Turret2/turret2.tscn"
	},
	"tower3" : {
		"name" : "tower3",
		"price" : 50,
		"dangerprice" : 5,
		"id" : 3,
		"range" : 400,
		"speed" : 5.0,
		"damage" : 5,
		"projectilespeed" : 60,
		"cooldown" : 0.5,
		"atlascoords" : Vector2i(0,3),
		"scenepath" : "res://Scenes/Main/Turrets/Turret3/turret3.tscn"
		}
}
