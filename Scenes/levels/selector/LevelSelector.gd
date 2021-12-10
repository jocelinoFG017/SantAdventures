extends Node


func _ready():
	pass


func _on_TextureButton_pressed():
	$Control/TextureButton/AudioStreamPlayer.play()
	get_tree().change_scene("res://Scenes/levels/Level_01.tscn")
