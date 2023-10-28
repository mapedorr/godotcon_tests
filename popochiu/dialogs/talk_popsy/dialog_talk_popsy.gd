@tool
extends PopochiuDialog


# ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░ VIRTUAL ░░░░
func _on_start() -> void:
	await C.player.face_clicked()
	await C.player.say("Hi")
	await C.Popsy.say("Hi...")
	
	# (!) It MUST always use an await
	await E.get_tree().process_frame


func _option_selected(opt: PopochiuDialogOption) -> void:
	match opt.id:
		"How":
			await E.queue([
				"Player: How are you today?",
				"Popsy: I'm... fine",
				"Player: Are you sure?",
				C.Popsy.queue_face_right(),
				"...",
				"Player: What happened?",
				C.Popsy.queue_face_left(),
				"Popsy(sad): [shake]I'M HUNGRY!!![/shake]"
			])
			
			opt.turn_off()
			turn_on_options(["Eat"])
		"Eat":
			await D.say_selected()
			await C.Popsy.say("I want an apple", "sad")
		"Exit":
			await C.player.say("See ya")
			await C.Popsy.say("Bye bye")
			
			stop()
	
	_show_options()


# ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░ PUBLIC ░░░░
# Use this to save custom data for this PopochiuDialog when saving the game.
# The Dictionary must contain only JSON supported types: bool, int, float, String.
func on_save() -> Dictionary:
	return {}


# Called when the game is loaded.
# This Dictionary should has the same structure you defined for the returned
# one in on_save().
func on_load(data: Dictionary) -> void:
	prints(data)
