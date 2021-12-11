extends Control


func _ready():
	pass


func _on_TextureButton_pressed():
	$TextureButton/playSound.play()
	get_tree().change_scene("res://Scenes/levels/selector/LevelSelector.tscn")


func _on_TextureButton2_pressed():
	$TextureButton2/playSound.play()
	get_tree().quit()


func _on_TextureButton3_pressed():
	$TextureButton3/playSound.play()
	get_tree().change_scene("res://Scenes/credits/Credits.tscn")
