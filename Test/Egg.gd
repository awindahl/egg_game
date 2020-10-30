extends RigidBody

var speed = 10

func _ready():
	$Camera.set_as_toplevel(true)

func _process(delta):
	
	if Input.is_action_pressed("w"):
		add_torque(Vector3(0, 0, -1) * speed)
	
	if Input.is_action_pressed("s"):
		add_torque(Vector3(0, 0, 1) * speed)
	
	if Input.is_action_pressed("a"):
		add_torque(Vector3(-1, 0, 0) * speed)
	
	if Input.is_action_pressed("d"):
		add_torque(Vector3(1, 0, 0) * speed)
