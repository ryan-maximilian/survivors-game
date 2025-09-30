extends Area3D

@export_subgroup("Hurtbox Properties")
@export var damage = 2
@export var faction: int = 0
@export var originator = get_parent()

# Collecting coins

func _on_body_entered(body):
	if body.has_method("get_hurt") and !body.get("hurt_timer"):
		
		body.get_hurt(damage, faction)
		
		Audio.play("res://sounds/coin.ogg") # Play sound
