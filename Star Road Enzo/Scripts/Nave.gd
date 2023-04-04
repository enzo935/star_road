extends KinematicBody

var movimento = Vector3.ZERO

func Inicio(tempo):
	movimento = Vector3(tempo,0,0)
	
	$Nave.rotation_degrees.y = 0.0 if sign(tempo) == 1 else 180.0

func _physics_process(delta):
	movimento = move_and_slide(movimento)

func _on_VisibilityNotifier_screen_exited():
	queue_free()
