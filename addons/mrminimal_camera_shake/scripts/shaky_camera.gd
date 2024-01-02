extends Node3D

@export_enum("[None]", "Investigation", "Closeup", "Wedding", "Walked to store", "Run", "Out of car") var animation: String = "Run"
@export var position_multiplier: float = 1.0
@export var rotation_multiplier: float = 1.0
@export var speed_multiplier: float = 1.0

const animation_paths = {
	"[None]": "",
	"Investigation": "shaky_cam_lib/investigation",
	"Closeup": "shaky_cam_lib/closeup",
	"Wedding": "shaky_cam_lib/wedding",
	"Walked to store": "shaky_cam_lib/walked_to_store",
	"Run": "shaky_cam_lib/run",
	"Out of car": "shaky_cam_lib/out_of_car"
}
const FPS = 24.0	# frames per second of the animations

var position_x: float = 0.0
var position_y: float = 0.0
var position_z: float = 0.0

var rotation_x: float = 0.0
var rotation_y: float = 0.0
var rotation_z: float = 0.0


func _process(_delta):
	var animation_player: AnimationPlayer = $AnimationPlayer
	animation_player.current_animation = animation_paths[animation]
	animation_player.speed_scale = FPS * self.speed_multiplier
	
	var camera: Camera3D = $Camera
	camera.position.x = position_x * position_multiplier
	camera.position.y = position_y * position_multiplier
	camera.position.z = position_z * position_multiplier
	camera.rotation.x = rotation_x * rotation_multiplier
	camera.rotation.y = rotation_y * rotation_multiplier
	camera.rotation.z = rotation_z * rotation_multiplier
