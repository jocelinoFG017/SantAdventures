extends Node2D



func _ready():
	pass 




func _on_head_body_entered(body):
	body.jump(800, false)
	queue_free()


func _on_Body_body_entered(body):
	body.killed()
