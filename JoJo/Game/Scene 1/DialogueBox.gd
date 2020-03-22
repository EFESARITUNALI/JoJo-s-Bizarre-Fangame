extends Node2D
class_name DialogueBox

export (String, FILE, "*.json") var filepath : String

func processDialogue(label: Label, text: String) -> void:
	$CanvasLayer/Bar/Text.visible_characters = 0
	$CanvasLayer/Bar/Text.text = text
	for i in range(0, text.length() + 1):
		label.visible_characters = i
		#wait(0.05)
		#yield(wait(0.05), "completed")
		
func interact() -> void:
	var dialogue : Dictionary = loadDialogue(filepath)
	print(dialogue)

func loadDialogue(path) -> Dictionary:
	var file = File.new()
	assert (file.file_exists(path))
	var dialogue = file.open(path, file.READ)
	assert (dialogue.size() > 0)
	return dialogue

