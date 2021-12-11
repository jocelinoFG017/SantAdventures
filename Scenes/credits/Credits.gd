extends Node


func _ready():
	$AudioStreamPlayer.play()
	pass


func _on_Button_pressed():
	$Button/AudioStreamPlayer2D.play()
	get_tree().change_scene("res://Scenes/gui/main.tscn")
