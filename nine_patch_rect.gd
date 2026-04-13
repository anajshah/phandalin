extends NinePatchRect

@onready var label = $Label

var dialog_lines = [
	"Evil Wizard: Ah... another traveler. Phandalin once belonged to hackers, artists, and adventurers... Now... it belongs to us.",
	"We have sealed Phandalin behind layers of unfinished ideas and abandoned projects. And now that you have entered you cannot leave",
	"Narrator: To free Phandalin, you must craft a playable role playing game, a world of your own design.",
	"Narrator: ...a fully playable game. And at the end you must fight the wizards (to submit you need at least one boss fight)",
	"When enough worlds are completed… the spell holding Phandalin will break and the town can be free.",
	"Enjoy!!"
]

var current_line = 0
var is_typing = false

func _ready():
	# Reset visibility just in case
	self.show()
	self.modulate.a = 1.0
	display_line()

func _input(event):
	if event.is_action_pressed("ui_accept"):
		if is_typing:
			label.visible_ratio = 1.0
			is_typing = false
		else:
			current_line += 1
			if current_line < dialog_lines.size():
				display_line()
			else:
				# This is the simplest way to make it go away
				queue_free()

func display_line():
	label.text = dialog_lines[current_line]
	label.visible_ratio = 0.0
	is_typing = true
	
	var tween = get_tree().create_tween()
	tween.tween_property(label, "visible_ratio", 1.0, 2.0)
	tween.finished.connect(func(): is_typing = false)
