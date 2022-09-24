extends Spatial

var angle_h = 0
var angle_v = 0

const angle_v_MIN = -75
const angle_v_MAX = 75

onready var camera = $xy/z/ClippedCamera


# Called when the node enters the scene tree for the first time.
func _ready():
	camera.add_exception(get_parent())
	

func _input(event):
	if event is InputEventMouseMotion:
		angle_h -= event.relative.x
		angle_v += event.relative.y
	# This function is copied off the Internet, so I'm not sure how well it works.
	# "Good programmers write good code, great programmers steal great code."
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_WHEEL_UP:
			camera.fov += 2
		elif event.button_index == BUTTON_WHEEL_DOWN:
			camera.fov -= 2
		
func _physics_process(delta):
	angle_v = clamp(angle_v, angle_v_MIN, angle_v_MAX)
	$xy.rotation_degrees.y = angle_h
	$xy/z.rotation_degrees.x = angle_v
	
