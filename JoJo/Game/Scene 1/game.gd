extends Node2D

var yazi=1
onready var subtitle = get_node("subtitle")
onready var Jotaro_Walking=get_node("Jotaro Walking")
onready var Jotaro_Idle=get_node("Jotaro Idle")
onready var Usagi_Walking=get_node("Usagi Walking")
onready var Usagi_Idle=get_node("Usagi Idle")
signal mouse_click

func _input(event):
	if(event.is_action("click")):
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

func usagi_arrives()-> void:
	Usagi_Walking.position=$UsagiPos/Walking.position
	Usagi_Idle.position=$UsagiPos/Idle.position
	Usagi_Walking.show()
	var tween=get_node("Tween")
	tween.interpolate_property(Usagi_Walking,"position",Usagi_Walking.position,Usagi_Idle.position,2,Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	tween.start()
	yield(tween,"tween_completed")
	Usagi_Walking.hide()
	Usagi_Idle.show()
	Usagi_Idle.play("Usagi Idle")

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
	jotaro_arrives()
	yield(self,"mouse_click")
	get_node("yazi").hide()
	yazi=0
	dialogue(subtitle, "They said I will meet a local hero here.")
	subtitle.show()
	yield(self,"mouse_click")
	yield(self,"mouse_click")
	subtitle.hide()
	dialogue(subtitle, "I'm wondering who is he...")
	subtitle.show()
	yield(self,"mouse_click")
	yield(self,"mouse_click")
	subtitle.hide()
	usagi_arrives()
	yield(self,"mouse_click")
	yield(self,"mouse_click")
	dialogue(subtitle, "Welcome to our neighborhood, Kujo-san.")
	subtitle.show()
	yield(self,"mouse_click")
	yield(self,"mouse_click")
	subtitle.hide()
	dialogue(subtitle, "Our friends from Speedwagon Foundation\n\nsaid you are used to fighting vampires.")
	subtitle.show()
	yield(self,"mouse_click")
	yield(self,"mouse_click")
	subtitle.hide()
	dialogue(subtitle, "So teaming up with you is a honour.")
	subtitle.show()
