extends StaticBody2D

signal broken;

var breakLevel = 0;
const maxBreakLevel = 5;

var playerNear: = false;
var mouseNear: = false;

@export var playerCollide: = true;
@export var mouseHover: = false;

var playerTouch: = false;
var mouseTouch: = false;
var touching: = false;

func _on_area_2d_body_entered(body):
	if body.is_in_group("player"):
		playerNear = true;


func _on_area_2d_body_exited(body):
	if body.is_in_group("player"):
		playerNear = false;

func _on_area_2d_mouse_entered():
	mouseNear = true;

func _on_area_2d_mouse_exited():
	mouseNear = false;

func isTouching():
	return touching;


func _on_check_break_timeout():
	var interact: = Input.is_action_pressed("interact");
	var click: = Input.is_action_pressed("mouse_click");
	playerTouch = playerNear and playerCollide;
	mouseTouch = mouseNear and mouseHover;
	touching = (playerTouch and interact) or (mouseTouch and click);

	if touching:
		breakLevel += 1;
		$BreakingAnimation.texture = load("res://assets/breaking/break%s.png" % (breakLevel + 1));
		if (breakLevel >= maxBreakLevel):
			emit_signal("broken");
			queue_free()
