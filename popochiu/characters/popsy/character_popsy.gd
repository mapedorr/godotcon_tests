@tool
extends PopochiuCharacter
# You can use E.queue([]) to trigger a sequence of events.
# Use await E.queue([]) if you want to pause the excecution of
# the function until the sequence of events finishes.

const Data := preload('character_popsy_state.gd')

var state: Data = load('res://popochiu/characters/popsy/character_popsy.tres')


# ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░ VIRTUAL ░░░░
# When the room in which this node is located finishes being added to the tree
func _on_room_set() -> void:
	pass


# When the node is clicked
func _on_click() -> void:
	D.TalkPopsy.start()


# When the node is right clicked
func _on_right_click() -> void:
	# Replace the call to super.on_right_click() to implement your code.
	super.on_right_click()


# When the node is clicked and there is an inventory item selected
func _on_item_used(item: PopochiuInventoryItem) -> void:
	await C.player.walk_to_clicked()
	await C.player.face_clicked()
	
	if item == I.Apple:
		item.remove()
		await C.Goddiu.say("Here it is")
		await C.Popsy.say("Yeeeeyyyyy", "happy")
		await E.wait(1)
		await C.Popsy.say("But I wanted a green apple", "sad")
		
		E.goto_room("End")


# Use it to play the idle animation for the character
func _play_idle() -> void:
	super()


# Use it to play the walk animation for the character
# target_pos can be used to know the movement direction
func _play_walk(target_pos: Vector2) -> void:
	super(target_pos)


# Use it to play the talk animation for the character
func _play_talk() -> void:
	if emotion == "sad":
		play_animation("cry")
	else:
		super()


# Use it to play the grab animation for the character
func _play_grab() -> void:
	super()
