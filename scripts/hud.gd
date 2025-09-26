extends Control

func _on_health_changed(health):
	
	$Health.text = str(health)

func _on_coin_collected(coins):
	
	$Coins.text = str(coins)
