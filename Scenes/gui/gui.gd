extends Control


func _ready():
	pass


func _on_TextureButton_pressed():
	$TextureButton/playSound.play()
	get_tree().change_scene("res://Scenes/levels/selector/LevelSelector.tscn")
