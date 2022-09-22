extends RigidBody


onready var camera = $Spatial/xy/z/ClippedCamera
onready var start_position = translation

func _physics_process(_delta):
	if Input.is_action_just_pressed("exit"):
		get_tree().quit()
	if Input.is_action_just_pressed("reset_position"):
		translation = start_position
		return

	var dir = Vector3()
	dir.x = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
	dir.z = Input.get_action_strength("move_back") - Input.get_action_strength("move_forward")

	# Get the camera's transform basis, but remove the X rotation such
	# that the Y axis is up and Z is horizontal.
	var cam_basis = camera.global_transform.basis
	var basis = cam_basis.rotated(cam_basis.x, -cam_basis.get_euler().x)
	dir = basis.xform(dir)

	apply_central_impulse(dir.normalized() / 10)


