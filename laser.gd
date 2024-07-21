extends Area2D

@export var speed=500
# Called when the node enters the scene tree for the first time.
func _ready():
	$Sprite2D.scale=Vector2(0,0)
	var tween=create_tween()
	tween.tween_property($Sprite2D,'scale',Vector2(1,1),0.3).from(Vector2(0,0))
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.y-=speed*delta
