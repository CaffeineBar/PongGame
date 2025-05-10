extends Sprite2D

var skor := [0,0] #[0:player, 1:cpu]
const KECEPATAN_PADEL: int = 500

func _on_timer_bola_timeout() -> void:
	$Bola.bola_baru()

func _on_goal_kiri_body_entered(body: Node2D) -> void:
	skor[1] += 1
	$HUD/SkorCPU.text = str(skor[1])
	$BolaGol.play()
	$TimerBola.start()

func _on_goal_kanan_body_entered(body: Node2D) -> void:
	skor[0] += 1
	$HUD/SkorPlayer.text = str(skor[0])
	$BolaGol.play()
	$TimerBola.start()
