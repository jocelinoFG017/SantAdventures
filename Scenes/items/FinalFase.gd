extends Area2D


func _ready():
	pass


func _on_FinalFase_body_entered(body):
	get_tree().change_scene("res://Scenes/levels/selector/LevelSelector.tscn")
