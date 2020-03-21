extends Node2D

onready var subtitle = get_node("subtitle")
onready var Jotaro_Walking=get_node("Jotaro Walking")
onready var Jotaro_Idle=get_node("Jotaro Idle")
signal mouse_click

func _input(event):
	if(event.is_pressed()):
		emit_signal("mouse_click")

func jotaro_arrives()-> void:
	Jotaro_Walking.position=$Pos/Walking.position
	Jotaro_Idle.position=$Pos/Idle.position
	Jotaro_Walking.show()
	var tween=get_node("Tween")
	tween.interpolate_property(Jotaro_Walking,"position",Jotaro_Walking.position,Jotaro_Idle.position,2,Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	tween.start()
	yield(tween,"tween_completed")
	Jotaro_Walking.hide()
	Jotaro_Idle.show()

func wait(duration: float) -> void:
	yield(get_tree().create_timer(duration), "timeout")
	print_debug("FINISHED WAITING FOR " + str(duration))

func dialogue(label: Label, text: String) -> void:
	label.visible_characters = 0
	label.text = text
	for i in range(0, text.length() + 1):
		label.visible_characters = i
		yield(wait(0.05), "completed")

func _ready():
	yield(self,"mouse_click")
	get_node("yazi").hide()
	dialogue(subtitle, "They said I will meet a local hero here. I'm wondering who is he?")
	subtitle.show()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Button_pressed():
	jotaro_arrives()
