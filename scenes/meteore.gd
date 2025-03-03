extends Area2D
var speed: int
var rotation_speed:int
var direction_x:float
signal collision
func _ready():
	var rng:=RandomNumberGenerator.new()
	#texture 
	var path:String="res://kenney_space-shooter-redux/PNG/Meteors/meteor"+str(rng.randi_range(1,20))+".png"
	$Sprite2D.texture=load(path)
	#start position
	var width=get_viewport().get_visible_rect().size[0]
	var random_x=rng.randi_range(0,width)
	var random_y=rng.randi_range(-150,-50)
	position=Vector2(random_x,random_y)
	
	#speed/rotation/direction
	speed=rng.randi_range(200,500)
	direction_x=rng.randf_range(-1,1) 
	rotation_speed=rng.randi_range(40,100)


func _process(delta):
	position+=Vector2(direction_x,1.0)*speed*delta
	rotation_degrees+=rotation_speed*delta



func _on_body_entered(body):
	collision.emit()
	


func _on_area_entered(area):
	area.queue_free()
	queue_free()
	
