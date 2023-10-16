extends ColorRect

@onready var _anim_player := $AnimationPlayer

func _ready() -> void:
	print("scene changed");
	_anim_player.play_backwards("Fade");

func transition_to(_next_scene: PackedScene) -> void:
	print("function is run");
	_anim_player.play("Fade");

	await _anim_player.animation_finished;

	print("changing scene now");
	get_tree().change_scene_to_packed(_next_scene);
