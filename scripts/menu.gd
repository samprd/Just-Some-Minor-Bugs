extends Node

@onready var level1 = load("res://level_1.tscn");
@onready var level2 = load("res://level_2.tscn");
@onready var level3 = load("res://level_3.tscn");
@onready var level4 = load("res://level_4.tscn");
@onready var level5 = load("res://level_5.tscn");
@onready var level6 = load("res://level_6.tscn");


func _on_level_1_pressed():
	$CanvasLayer/SceneTransitionRect.transition_to(level1);


func _on_level_2_pressed():
	$CanvasLayer/SceneTransitionRect.transition_to(level2);


func _on_level_3_pressed():
	$CanvasLayer/SceneTransitionRect.transition_to(level3);


func _on_level_4_pressed():
	$CanvasLayer/SceneTransitionRect.transition_to(level4);


func _on_level_5_pressed():
	$CanvasLayer/SceneTransitionRect.transition_to(level5);


func _on_level_6_pressed():
	$CanvasLayer/SceneTransitionRect.transition_to(level6);
