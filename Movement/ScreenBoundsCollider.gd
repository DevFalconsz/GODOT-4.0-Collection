extends CharacterBody2D

func _process(_delta) -> void:
	limit_position_inside_screen()

func limit_position_inside_screen() -> void:
	var right_border : float = get_viewport().size.x
	var up_border : float = get_viewport().size.y

	if global_position.x > right_border:
		global_position.x = right_border
		
	if global_position.x < 1:
		global_position.x = 1
		
	if global_position.y < 1:
		global_position.y = 1
		
	if global_position.y > up_border:
		global_position.y = up_border
