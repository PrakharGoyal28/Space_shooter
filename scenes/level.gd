extends Node2D
#1. load the scene

		
	



#1 load the scene
var meteor_scene:PackedScene=load("res://scenes/meteore.tscn")
var laser_scene:PackedScene=load("res://laser.tscn")

var health:int=3



func _ready():
	#set up health ui
	get_tree().call_group('ui','set_health',health)
	
	#stars
	var size :=get_viewport().get_visible_rect().size
	var rng := RandomNumberGenerator.new()
	
	for star in $Stars.get_children():
		var random_x=rng.randi_range(0,int(size.x)) 
		var random_y=rng.randi_range(0,int(size.y))
		star.position=Vector2(random_x,random_y)
		
		#scale
		var random_scale=rng.randf_range(1,2)
		star.scale=Vector2(random_scale,random_scale)
		
		#animation speed
		star.speed_scale=rng.randf_range(0.6,1.4)
		
		
		
func _on_meteor_timer_timeout():
	#create an instantaite
	var meteor=meteor_scene.instantiate()
	
	#3 attach the node to the scene tree
	$Meteors.add_child(meteor)
	
	#connect the signal
	meteor.connect('collision',on_meteor_collision)
	
	
func on_meteor_collision():
	health-=1
	get_tree().call_group('ui','set_health',health)
	if health<=0:
		get_tree().change_scene_to_file("res://scenes/game_over.tscn")



func _on_player_laser(pos):
	var laser=laser_scene.instantiate()
	$Lasers.add_child(laser)
	laser.position=pos

