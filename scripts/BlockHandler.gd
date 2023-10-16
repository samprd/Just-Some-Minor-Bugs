extends Node

signal block_broken;

func _ready():
	for block in get_tree().get_nodes_in_group("breakable_block"):
		block.broken.connect(_broken)

func _broken():
	emit_signal("block_broken");
