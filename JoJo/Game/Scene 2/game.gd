extends Node2D


onready var subtitle = get_node("subtitle")
onready var Jotaro_Walking=get_node("Jotaro Walking")
onready var Jotaro_Idle=get_node("Jotaro Idle")
onready var Jotaro_Falls=get_node("Jotaro Falls")
onready var Usagi_Walking=get_node("Usagi Walking")
onready var Usagi_Idle=get_node("Usagi Idle")
onready var Usagi_Kick=get_node("Usagi Kick")
onready var Usagi_Punch=get_node("Usagi Punch")
onready var timelabel = get_node("time")
onready var sublime = get_node("sublime")

func wait(duration: float) -> void:
	yield(get_tree().create_timer(duration), "timeout")


func dialogue(label: Label, text: String) -> void:
	label.visible_characters = 0
	label.text = text
	for i in range(0, text.length() + 1):
		label.visible_characters = i
		yield(wait(0.05), "completed")


var punch_count = 0
var kick_count = 0
var flag = 1

func _puncher(time):
	if(flag == 1):
		if(time > 0.1):
			punch_count+=1
			flag = 0
			Usagi_Idle.hide()
			Usagi_Punch.show()
			Usagi_Punch.play()
			yield(wait(0.8),"completed")
			flag = 1
			Usagi_Idle.show()
			Usagi_Punch.hide()
			Usagi_Punch.frame = 0
			Usagi_Kick.frame = 0
		elif(time <= 0.1):
			kick_count+=1
			flag = 0
			Usagi_Idle.hide()
			Usagi_Kick.show()
			Usagi_Kick.play()
			yield(wait(0.7),"completed")
			flag = 1
			Usagi_Idle.show()
			Usagi_Kick.hide()
			Usagi_Kick.frame = 0
			Usagi_Punch.frame = 0
		yield(wait(0.2),"completed")

var timer:= 0
func _ready():
	
	Usagi_Kick.hide()
	Usagi_Punch.hide()
	Jotaro_Idle.position=$JotaroPosition/JotaroIdle.position
	Usagi_Idle.position=$UsagiPositon/UsagiPunchDistance.position
	Usagi_Kick.position=$UsagiPositon/UsagiPunchDistance.position
	Usagi_Punch.position=$UsagiPositon/UsagiPunchDistance.position
	Jotaro_Falls.position=$JotaroPosition/JotaroFall.position
	Jotaro_Falls.hide()
	Jotaro_Idle.show()
	Usagi_Idle.show()
	get_node("MouseFrequencyDetector").connect("puncher", self, "_puncher")

func _on_Timer_timeout():
	timer += 1


func _process(delta):
	
	timelabel.text = str(10 - timer)
	timelabel.show()
	var sum = punch_count + kick_count*2
	if(sum >= 35):
		dialogue(sublime,"You beat me !!")
		Jotaro_Falls.position=$JotaroPosition/JotaroFall.position
		Jotaro_Idle.position=$JotaroPosition/JotaroIdle.position
		Jotaro_Falls.show()
		Jotaro_Falls.play()
		Jotaro_Idle.hide()
		var tween=get_node("Tween")
		tween.interpolate_property(Jotaro_Falls,"position",Jotaro_Idle.position,Jotaro_Falls.position,1,Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
		tween.start()
		yield(tween,"tween_completed")
		wait(1.5)
		get_tree().change_scene("res://Game/Scene 3/Ending.tscn")
		
		
	if(timer >= 10):
		timer = 0
		if(sum <= 35):
			dialogue(sublime,"You hit like a girl, I'll give you another chance...")
			
		
	
	
