extends CharacterBody2D

var ukuran_window: Vector2
const KECEPATAN_MULAI: int = 500
const AKSELERASI: int = 50
var kecepatan: int
var arah: Vector2
const VECTOR_Y_MAKSIMAL: float = 0.6

#dipanggil saat node masuk ke scene tree untuk pertama kali
func _ready() -> void:
	ukuran_window = get_viewport_rect().size

func bola_baru() -> void:
	#posisi mulai random
	position.x = ukuran_window.x / 2
	position.y = randi_range(200, ukuran_window.y - 200)
	kecepatan = KECEPATAN_MULAI
	arah = arah_random()

func _physics_process(delta: float):
	var collision = move_and_collide(arah * kecepatan * delta)
	var collider
	if collision:
		collider = collision.get_collider()
		if collider == $"../Player" or collider == $"../CPU":
			kecepatan += AKSELERASI
			arah = arah.bounce(collision.get_normal())
			$PantulanBola.play()
		else:
			arah = arah.bounce(collision.get_normal())

func arah_random():
	var arah_baru := Vector2()
	arah_baru.x = [1, -1].pick_random() #menentukan arah kanan atau kiri secara acak di awal
	arah_baru.y = randf_range(-1, 1)
	return arah_baru.normalized()

func kalkulasi_arah_baru(collider):
	var bola_y = position.y
	var padel_y = collider.position.y
	var jarak = bola_y - padel_y
	var arah_baru := Vector2()
	
	if jarak.x > 0:
		arah_baru.x = -1
	else:
		arah_baru.x = 1
	arah_baru.y = (jarak / (collider.tinggi_padel / 2)) * VECTOR_Y_MAKSIMAL
	return arah_baru.normalized()
