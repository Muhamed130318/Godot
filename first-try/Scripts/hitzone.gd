extends Area2D

@onready var game_manager: Node = %GameManager
@onready var health_label: Label = $GameManager/healthLabel
@onready var killzone: Area2D = $Killzone
const hitValue = 10

@onready var pHealth = $GameManager
