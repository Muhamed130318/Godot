extends Node

var score = 0
@onready var score_label: Label = $scoreLabel
@onready var health_label: Label = $healthLabel

@onready var killzone: Area2D = $"../Killzone"

func add_point():
	score += 1
	score_label.text = "Score: " + str(score)
