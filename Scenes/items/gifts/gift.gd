extends Area2D


func _ready():
	pass


func _on_gift_body_entered(body):
	$AudioStreamPlayer2D.play()
	$AnimatedSprite.visible = false
	collision_mask = 0
	$queueTimer.start()


func _on_queueTimer_timeout():
	queue_free()
