extends Sprite2D

@export_category("Indicator Settings")
@export var door: Node;
@export_enum("Interact", "Mouse Click") var indicator_type: String;
@export var startVisibility: Color = "#ffffff00";
@export var endVisibility: Color = "#ffffffff";

func _ready():
	modulate = startVisibility

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if indicator_type == "Interact":
		if door.isInteracted():
			modulate = endVisibility
		else:
			modulate = startVisibility
	elif indicator_type == "Mouse Click":
		if door.isHovered():
			modulate = endVisibility
		else:
			modulate = startVisibility
