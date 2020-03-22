extends Node2D

var displacement
var thereshold := 120

var punches := 0
var processedPunches := punches
var TimeBetweenLastPunch:= 0.0


func _ready():
	pass


func _process(delta):
	#print(displacement)
	#print(thereshold)
	
	if(punches != processedPunches):
		processedPunches = punches
		TimeBetweenLastPunch = 0.0
	else:
		TimeBetweenLastPunch += delta
		
	print(punches)
	print(TimeBetweenLastPunch)
	pass
	
func _input(event):
	if event is InputEventMouseMotion:
		displacement = event.relative
		if abs(displacement.x) >= thereshold:
			punches = punches + 1
			print(displacement)
