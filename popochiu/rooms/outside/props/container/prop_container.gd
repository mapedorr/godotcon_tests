@tool
extends PopochiuProp
# You can use E.queue([]) to trigger a sequence of events.
# Use await E.queue([]) if you want to pause the excecution of
# the function until the sequence of events finishes.


# ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░ VIRTUAL ░░░░
# When the node is clicked
func _on_click() -> void:
	await C.player.walk_to_clicked()
	await C.player.face_clicked()
	
	match current_frame:
		0:
			await C.Goddiu.say("It is closed")
		1:
			await I.Key.remove()
			await change_frame(2)
			await C.player.say("There is a hook!", "happy")
			await C.player.say("I'm gonna use it to grab the apple")
			await change_frame(3)
			await I.Hook.add()
		3:
			await C.Goddiu.say("Its empty")


# When the node is right clicked
func _on_right_click() -> void:
	# Replace the call to super.on_right_click() to implement your code.
	# E.g. you can make the character walk to the Prop and then say
	# something:
#	await C.player.face_clicked()
#	await C.player.say("A deck of cards")
	super.on_right_click()


# When the node is clicked and there is an inventory item selected
func _on_item_used(item: PopochiuInventoryItem) -> void:
	await C.player.walk_to_clicked()
	await C.player.face_clicked()
	
	if item == I.Key:
		await change_frame(1)
		await C.player.say("Now it is open")


# When an inventory item linked to this Prop (link_to_item) is removed from
# the inventory (i.e. when it is used in something that makes use of the object).
func on_linked_item_removed() -> void:
	pass


# When an inventory item linked to this Prop (link_to_item) is discarded from
# the inventory (i.e. when the player throws the object out of the inventory).
func on_linked_item_discarded() -> void:
	pass
