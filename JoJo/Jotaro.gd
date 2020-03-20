extends Sprite


var timer
var ileri=1


# Called when the node enters the scene tree for the first time.
func _ready():
	timer=Timer.new()
	timer.connect("timeout",self,"tick")
	add_child(timer)
	timer.wait_time=0.2
	timer.start()

func tick():
	if(ileri):
		if(self.frame<3):
			self.frame=self.frame+1
		else:
			self.frame=self.frame-1
			ileri=0
	else:
		if(self.frame>0):
			self.frame=self.frame-1
		else:
			self.frame=self.frame+1
			ileri=0


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
