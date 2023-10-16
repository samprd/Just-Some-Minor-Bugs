extends TileMap

var playerDetected: = false;

func _on_area_2d_body_entered(body):
	if body.is_in_group("player"):
		playerDetected = true;


func _on_area_2d_body_exited(body):
	if body.is_in_group("player"):
		playerDetected = false;

func isPlayerDetected():
	return playerDetected;
