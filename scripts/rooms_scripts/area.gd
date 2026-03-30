extends Area2D

@export var hold = false


@export var will_revert_changes = false
var revert_changes = false

signal action(body : Node2D, area : Area2D)
