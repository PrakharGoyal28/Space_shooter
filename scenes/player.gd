extends CharacterBody2D

@export var speed:int=500 #export give to show in inspector
# Called when the node enters the scene tree for the first time.
var can_shoot:bool=true
signal laser(pos)
func _ready():
	position=Vector2(100,500)


# Called every frame. 'delta' is th e elapsed time since the previous frame.
func _process(delta):
	var direction=Input.get_vector("left","right","up","down")
	velocity=direction*speed
	move_and_slide()
	#position+=direction * delta * speed
	#if Input.is_action_pressed("ui_down"):
		#position+=Vector2(1,0)*50*delta
		#$PlayerImage.rotation+=0.1*delta
	#get_node("PlayerImage").rotation+=0.1*delta
	 
	#shoot input  
	if Input.is_action_just_pressed("shoot"):
		laser.emit($LaserStartPos.global_position)
		can_shoot=false
		$LaserTimer.start()
		$LaserSound.play()
	


func _on_laser_timer_timeout():
	can_shoot=true
