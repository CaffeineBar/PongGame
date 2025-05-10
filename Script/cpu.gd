extends StaticBody2D

var posisi_bola: Vector2
var jarak: int
var bergerak_oleh: int
var tinggi_window: int
var tinggi_padel: int

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	tinggi_window = get_viewport_rect().size.y
	tinggi_padel = $ColorRect.get_size().y


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	posisi_bola = $"../Bola".position
	jarak = position.y - posisi_bola.y
	
	if abs(jarak) > get_parent().KECEPATAN_PADEL *  delta:
		bergerak_oleh = get_parent().KECEPATAN_PADEL * delta * (jarak / abs(jarak))
	else:
		bergerak_oleh = jarak
	
	position.y -= bergerak_oleh
	
	position.y = clamp(position.y, tinggi_padel / 2 + 80, tinggi_window - tinggi_padel / 2 - 80)
