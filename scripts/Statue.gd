extends Sprite2D

signal turn_off_light;
signal turn_on_light;

var playerNear: = false
var mouseNear: = false
var playerCollide: = true;
@export_category("Statue Properties")
@export var mouseHover: = false;
@export var startDisabled: = false;
@export var exit: Node;
@export_group("Sprites")
@export var light_off: Texture2D;
@export var light_on: Texture2D;

var playerTouch: = false;
var mouseTouch: = false;
var touching: = false;

var light_state: = false;

# Called when the node enters the scene tree for the first time.
func _ready():
	if startDisabled:
		disableDoor();

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var interact: = Input.is_action_just_pressed("interact");
	var click: = Input.is_action_just_pressed("mouse_click");
	playerTouch = playerNear and playerCollide;
	mouseTouch = mouseNear and mouseHover;
	touching = (playerTouch and interact) or (mouseTouch and click);

	if touching and !exit.canExit():
		switchLight();
		await Input.is_action_just_released("interact");


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

func isTouching():
	return touching;

func switchLight():
	if light_state:
		set_texture(light_off);
		emit_signal("turn_off_light");
		light_state = false;
	else:
		set_texture(light_on);
		emit_signal("turn_on_light");
		light_state = true;
