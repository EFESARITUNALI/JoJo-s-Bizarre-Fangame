extends Node2D

var gamestarted=0

# Called when the node enters the scene tree for the first time.
func _ready():
	get_node("pausemenu").set("focus/ignore_mouse", true)
	get_node("pausemenu").hide()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(Input.is_action_just_pressed("pause")&&gamestarted):
		get_node("pausemenu").set("focus/ignore_mouse", false)
		get_node("pausemenu").show()


func _on_Button_pressed():
	get_node("menu").set("focus/ignore_mouse", true)
	get_node("menu").hide()
	gamestarted=1


func _on_Button2_pressed():
	get_node("AudioStreamPlayer2D").stream_paused=not(get_node("AudioStreamPlayer2D").stream_paused)


func _on_PauseButton_pressed():
	get_node("pausemenu").set("focus/ignore_mouse", true)
	get_node("pausemenu").hide()
