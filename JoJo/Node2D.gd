extends Node2D

var gamestarted=0

# Called when the node enters the scene tree for the first time.
func _ready():
	get_node("pausemenu").set("focus/ignore_mouse", true)
	get_node("pausemenu").hide()
	get_node("game").set("focus/ignore_mouse", true)
	get_node("game").hide()
	set_pause_node(get_node("game"),1)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(Input.is_action_just_pressed("pause")&&gamestarted):
		get_node("pausemenu").set("focus/ignore_mouse", false)
		get_node("pausemenu").show()
		get_node("game").set("focus/ignore_mouse", true)
		set_pause_node(get_node("game"),1)
		get_node("game/yazi").hide()

func set_pause_node(node : Node, pause : bool) -> void:
	node.set_process(!pause)
	node.set_process_input(!pause)
	node.set_process_internal(!pause)
	node.set_process_unhandled_input(!pause)
	node.set_process_unhandled_key_input(!pause)

func _on_Button_pressed():
	get_node("menu").set("focus/ignore_mouse", true)
	get_node("menu").hide()
	gamestarted=1
	get_node("game").set("focus/ignore_mouse", false)
	get_node("game").show()
	set_pause_node(get_node("game"),0)


func _on_Button2_pressed():
	get_node("AudioStreamPlayer2D").stream_paused=not(get_node("AudioStreamPlayer2D").stream_paused)


func _on_PauseButton_pressed():
	get_node("pausemenu").set("focus/ignore_mouse", true)
	get_node("pausemenu").hide()
	set_pause_node(get_node("game"),0)
	if(get_node("game").yazi):
		get_node("game/yazi").show()
