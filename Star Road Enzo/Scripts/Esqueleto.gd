extends Area

var direcao = Vector3.ZERO

func _physics_process(delta):
	movimentacao()

func movimentacao():
	direcao = Vector3.ZERO
	var rotacaoInicial = $Malha.rotation_degrees.y
	var rotacaoFinal = $Malha.rotation_degrees.y
	
	if Input.is_action_pressed("Frente"):
		if not $Frente.is_colliding() : direcao = Vector3(0,0,0.6)
		if rotacaoInicial != 0.0 : rotacaoFinal = 0.0
		
	elif Input.is_action_pressed("Esquerda"):
		if not $Esquerda.is_colliding() : direcao = Vector3(0.6,0,0)
		if rotacaoInicial != 90.0 : rotacaoFinal = 90.0
	
	elif Input.is_action_pressed("Direita"):
		if not $Direita.is_colliding() : direcao = -Vector3(0.6,0,0)
		if rotacaoInicial != -90.0 : rotacaoFinal = -90.0
	
	elif Input.is_action_pressed("Tras"):
		if not $Costas.is_colliding() : direcao = -Vector3(0,0,0.6)
		if rotacaoInicial != 180.0 : rotacaoFinal = 180.0

	var posicaoInicial = self.translation
	var posicaoFinal = posicaoInicial + (direcao *2)
	
	$Movimentacao.interpolate_property(self, "translation", posicaoInicial, posicaoFinal, 0.1, Tween.TRANS_BOUNCE, Tween.EASE_OUT)
	$Movimentacao.start()
	
	$Rotacao.interpolate_property($Malha, "rotation_degrees:y", rotacaoInicial, rotacaoFinal, 0.1, Tween.TRANS_EXPO, Tween.EASE_OUT)
	$Rotacao.start()


func _on_VisibilityNotifier_screen_exited():
	get_parent().amassado = true
	set_physics_process(false)


func _on_Robo_body_entered(body):
	if body.is_in_group('obstaculos moveis'):
		$Malha.visible = false
		$Cruz.visible = true
		set_physics_process(false)
		get_parent().amassado = true
