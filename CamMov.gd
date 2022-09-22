extends Spatial

var cam_view = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	$xy/ClippedCamera.add_exception(get_parent())
	

func _input(event):
	if event is InputEventMouseMotion:
		cam_view -= event.relative.x
		
func _physics_process(delta):
	$xy.rotation_degrees.y = cam_view
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
