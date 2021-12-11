extends Node


func _ready():
	pass


func _on_TextureButton_pressed():
	$Control/TextureButton/AudioStreamPlayer.play()
	get_tree().change_scene("res://Scenes/levels/Level_01.tscn")


func _on_TextureButton5_pressed():
	$Control/TextureButton5/AudioStreamPlayer.play()
	get_tree().change_scene("res://Scenes/gui/main.tscn")


func _on_TextureButton2_pressed():
	$Control/TextureButton2/AudioStreamPlayer.play()
	get_tree().change_scene("res://Scenes/levels/Level_02.tscn")
