extends TileMap

func _ready() -> void:
	modulate = "#ffffffff";

func _on_area_2d_body_entered(body) -> void:
	if body.is_in_group("player"):
		modulate = "#ffffff96";
