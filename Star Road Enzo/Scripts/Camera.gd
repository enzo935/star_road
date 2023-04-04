extends KinematicBody

var velocidade = 3.0
var movimentacao = Vector3.ZERO

var novaFaixa = 0
var velhaFaixa = 0

func _physics_process(delta):
	movimentacao = lerp(movimentacao, velocidade * Vector3.BACK, 0.05)
	movimentacao = move_and_slide(movimentacao)
	novaFaixa = int(translation.z)
	if novaFaixa == velhaFaixa+2:
		velhaFaixa = novaFaixa
		get_parent().AdicionarFaixa()
