extends TileMap

var playerNear: = false
var mouseNear: = false
var playerCollide: = true;
@export_category("Door Properties")
@export var mouseHover: = false;
@export var startDisabled: = false;
@export var sceneTransition: Node;
@onready var menuScene = load("res://menu.tscn");

var playerTouch: = false;
var mouseTouch: = false;
var touching: = false;

var transitioned: = false;

# Called when the node enters the scene tree for the first time.
func _ready():
	transitioned = false;
	if startDisabled:
		disableDoor();

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var interact: = Input.is_action_pressed("interact");
	var click: = Input.is_action_just_pressed("mouse_click");
	playerTouch = playerNear and playerCollide;
	mouseTouch = mouseNear and mouseHover;
	touching = (playerTouch and interact) or (mouseTouch and click);

	if touching and !transitioned:
		sceneTransition.transition_to(menuScene);
		transitioned = true;


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

func disableDoor():
	modulate = "#ffffff00";
	playerCollide = false;

func getDoorState():
	return playerCollide;

func enableDoor():
	modulate = "#ffffffff";
	playerCollide = true;

func isInteracted():
	return playerTouch;

func isHovered():
	return mouseTouch;
