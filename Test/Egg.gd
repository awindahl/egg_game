extends RigidBody

var speed = 10

export(NodePath) var PlayerPath  = "" #You must specify this in the inspector!
export(float) var MovementSpeed = 10
export(float) var Acceleration = 3
export(float) var MaxJump = 19
export(float) var MouseSensitivity = 2
export(float) var RotationLimit = 45
export(float) var MaxZoom = 0.5
export(float) var MinZoom = 1.5
export(float) var ZoomSpeed = 2

var Player
var InnerGimbal
var Direction = Vector3()
var Rotation = Vector2()
var gravity = -10
var Movement = Vector3()
var ZoomFactor = 1
var ActualZoom = 1
var Speed = Vector3()
var CurrentVerticalSpeed = Vector3()
var JumpAcceleration = 3
var IsAirborne = false

func _ready():
	$Camera.set_as_toplevel(true)
	
func _unhandled_input(event):
	if event is InputEventMouseMotion :
		Rotation = event.relative
	
	if event is InputEventMouseButton:
		match event.button_index:
			BUTTON_WHEEL_UP:
				ZoomFactor -= 0.05
			BUTTON_WHEEL_DOWN:
				ZoomFactor += 0.05
		ZoomFactor = clamp(ZoomFactor, MaxZoom, MinZoom)
	if event is InputEventKey and event.pressed:
		match event.scancode:
			KEY_ESCAPE:
				get_tree().quit()
			KEY_Z: #FORWARD
				Direction.z -= 1
			KEY_S: #BACKBAWRD
				Direction.z += 1
			KEY_Q: #LEFT
				Direction.x -= 1
			KEY_D: #RIGHT
				Direction.x += 1
	if event is InputEventKey and not event.pressed:
		match event.scancode:
			KEY_Z:
				Direction.z += 1
			KEY_S:
				Direction.z -= 1
			KEY_Q:
				Direction.x += 1
			KEY_D:
				Direction.x -= 1
			KEY_SPACE:
				if not IsAirborne:
					CurrentVerticalSpeed = Vector3(0,MaxJump,0)
					IsAirborne = true
	Direction.z = clamp(Direction.z, -1,1)
	Direction.x = clamp(Direction.x, -1,1)

func _process(delta):
	
	if Input.is_action_pressed("w"):
		add_torque(Direction * speed)
	
	if Input.is_action_pressed("s"):
		add_torque(Direction * speed)
	
	if Input.is_action_pressed("a"):
		add_torque(Direction * speed)
	
	if Input.is_action_pressed("d"):
		add_torque(Direction * speed)
	
