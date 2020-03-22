extends Node2D

	#pause func
func set_pause_node(node : Node, pause : bool) -> void:
	node.set_process(!pause)
	node.set_process_input(!pause)
	node.set_process_internal(!pause)
	node.set_process_unhandled_input(!pause)
	node.set_process_unhandled_key_input(!pause)


func _ready():
	pass # Replace with function body.
	


func _process(delta):
	#P to pause
	if(Input.is_action_just_pressed("pause")):
		get_node("pausemenu").set("focus/ignore_mouse", false)
		get_node("pausemenu").show()
		get_node("game").set("focus/ignore_mouse", true)
		set_pause_node(get_node("game"),1)
		
	

	#audio Play/stop
func _on_Button_pressed():
	get_node("AudioStreamPlayer").stream_paused = not(get_node("AudioStreamPlayer").stream_paused)

	#pasued resume
func _on_PauseButton_pressed():
	get_node("pausemenu").set("focus/ignore_mouse", true)
	get_node("pausemenu").hide()
	set_pause_node(get_node("game"),0)




