@tool
extends PopochiuRoom

const Data := preload('room_house_state.gd')

var state: Data = load('res://popochiu/rooms/house/room_house.tres')


# ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░ GODOT ░░░░
# TODO: Overwrite Godot's methods


# ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░ VIRTUAL ░░░░
# What happens when Popochiu loads the room. At this point the room is in the
# tree but it is not visible
func _on_room_entered() -> void:
	A.mx_two_popochius.play()
	
	if C.player.last_room == "Outside":
		A.sfx_door_close.play()


# What happens when the room changing transition finishes. At this point the room
# is visible.
func _on_room_transition_finished() -> void:
	if C.player.last_room != "Outside":
		await C.Goddiu.say("Hi")
		await C.Popsy.say("Hi")
		await C.Goddiu.say("We are in the [rainbow]GodotCon[/rainbow]!!!")
		await C.Popsy.say("[shake]YEEEEYYYYYYY[/shake]")


# What happens before Popochiu unloads the room.
# At this point, the screen is black, processing is disabled and all characters
# have been removed from the $Characters node.
func _on_room_exited() -> void:
	if Globals.going_to_the_end:
		return
	
	A.sfx_door_close.play()


# ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░ PUBLIC ░░░░
# You could put public functions here


# ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░ PRIVATE ░░░░
# You could put private functions here
