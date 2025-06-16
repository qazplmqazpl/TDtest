extends Node

var selected_map := "map1"
var mainNode : Node2D
var currentMap : Node2D
var hud : Control
var currentgold := 1000
var currenthp := 100
var cursormode := 0 # 0 normal/ 1 selecting tower placement / 2 removing a tower
