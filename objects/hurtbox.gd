class_name HurtBox extends Area3D

@export_subgroup("Hurtbox Properties")
@export var damage = 2
@export var faction: int = 0
@export var originator = get_parent()
@export var lifetime: float = 1.0 ## Lifetime in Seconds

# @export_subgroup("Hurtbox Dimensions")
# @export var width = 2
# @export var height = 2
# @export var depth = 2

func _ready():

	start_lifetime(lifetime)

# Collide

func _on_body_entered(body):
	if body.has_method("get_hurt") and !body.get("hurt_timer"):
		
		body.get_hurt(damage, faction)
		
		Audio.play("res://sounds/coin.ogg") # Play sound

# Destroy the hurtbox

var _timer: SceneTreeTimer

func start_lifetime(seconds: float) -> void:
	print("Hey, my name is ", self.name, ", and I'm alive!")
	_timer = get_tree().create_timer(seconds)
	await _timer.timeout
	if is_inside_tree():
		print("Hey, my name is ", self.name, ", and I'm dying! Goodbye :D:D")
		queue_free()
