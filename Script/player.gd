extends StaticBody2D

var tinggi_window: int
var tinggi_padel: int

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	tinggi_window = get_viewport_rect().size.y
	tinggi_padel = $ColorRect.get_size().y

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_pressed("wasd_up"):
		position.y -= get_parent().KECEPATAN_PADEL *  delta
		print("Bergerak ke atas")
	if Input.is_action_pressed("wasd_down"):
		position.y += get_parent().KECEPATAN_PADEL *  delta
		print("Bergerak ke bawah")
	
	#Batas gerakan padel
	position.y = clamp(position.y, tinggi_padel / 2 + 80, tinggi_window - tinggi_padel / 2 - 80)
	
