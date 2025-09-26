extends Area3D

@export_subgroup("Properties")
@export var damage = 2

# Collecting coins

func _on_body_entered(body):
	if body.has_method("get_hurt") and !body.get("hurt_timer"):
		
		body.get_hurt(damage)
		
		Audio.play("res://sounds/coin.ogg") # Play sound