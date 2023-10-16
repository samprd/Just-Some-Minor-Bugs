extends Node

var playerNear: = false
var playerCollide: = true;
@export_category("Exit Properties")
@export var statueManager: Node;
@export var sceneTransition: Node;
@onready var menuScene = load("res://menu.tscn");

var playerTouch: = false;

var exitAnimationPlayed: = false;

var transitioned: = false;

func _ready():
	transitioned = false;

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if statueManager.isStatueSet() and !exitAnimationPlayed:
		$AnimationPlayer.play("exit_open");
		exitAnimationPlayed = true;

	playerTouch = playerNear and playerCollide;

	if playerTouch and !transitioned:
		sceneTransition.transition_to(menuScene);
		transitioned = true;


func _on_area_2d_body_entered(body):
	if body.is_in_group("player"):
		playerNear = true;


func _on_area_2d_body_exited(body):
	if body.is_in_group("player"):
		playerNear = false;

func canExit():
	return exitAnimationPlayed;
