extends Spatial

var angle_h = 0
var angle_v = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	$xy/z/ClippedCamera.add_exception(get_parent())
	

func _input(event):
	if event is InputEventMouseMotion:
		angle_h -= event.relative.x
		angle_v += event.relative.y
		
func _physics_process(delta):
	$xy.rotation_degrees.y = angle_h
	$xy/z.rotation_degrees.x = angle_v
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
