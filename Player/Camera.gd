extends Camera

var offset

func _init():
	set_as_toplevel(true)

func _ready():
	offset = get_global_transform().origin

func _process(delta):
	var target = get_parent().get_global_transform().origin
	var pos = offset + target
	var up = Vector3(0, 1, 0)
	#look_at_from_position(pos, target, up)
