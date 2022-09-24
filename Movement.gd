extends KinematicBody


onready var camera = $Spatial/xy/z/ClippedCamera
var dir = Vector3.FORWARD
const MOVE_SPEED = 6 # YOU CAN MODIFY AND PLAY AROUND WITH THIS

func _physics_process(_delta):

	var xy = camera.global_transform.basis.get_euler().y
	
	dir = Vector3()
	dir.x = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
	dir.z = Input.get_action_strength("move_back") - Input.get_action_strength("move_forward")
	dir = dir.rotated(Vector3.UP, xy)
	
	move_and_slide(dir * MOVE_SPEED, Vector3.UP)
	# Get the camera's transform basis, but remove the X rotation such
	# that the Y axis is up and Z is horizontal.
	var cam_basis = camera.global_transform.basis
	var basis = cam_basis.rotated(cam_basis.x, -cam_basis.get_euler().x)
	dir = basis.xform(dir)

