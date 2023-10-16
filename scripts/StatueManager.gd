extends Node

var statueLeft: = false;
var statueCenter: = false;
var statueRight: = false;
var statueSet: = false;

func setStatues():
	statueSet = statueLeft and statueCenter and statueRight;

func isStatueSet():
	return statueSet;


func _on_statue_2_turn_off_light():
	statueRight = false;
	setStatues()


func _on_statue_2_turn_on_light():
	statueRight = true;
	setStatues()


func _on_statue_3_turn_off_light():
	statueCenter = false;
	setStatues()


func _on_statue_3_turn_on_light():
	statueCenter = true;
	setStatues()


func _on_statue_4_turn_off_light():
	statueLeft = false;
	setStatues()


func _on_statue_4_turn_on_light():
	statueLeft = true;
	setStatues()
