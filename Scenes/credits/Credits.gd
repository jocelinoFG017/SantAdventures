extends Node


func _ready():
	pass


func _on_Button_pressed():
	$AudioStreamPlayer.play()
	get_tree().change_scene("res://Scenes/gui/main.tscn")
