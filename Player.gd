extends Area2D

@export var speed = 400
@onready var b_gmusic = $"../BGmusic"
@onready var enemy_hit = $"../EnemyHit"

func _ready():
	b_gmusic.play()
func _process(delta):
	var velocity = Vector2.ZERO
	if Input.is_action_pressed("move_left"):
		velocity.x += -1
	if Input.is_action_pressed("move_right"):
		velocity.x += 1
	if Input.is_action_pressed("move_down"):
		velocity.y += 1
	if Input.is_action_pressed("move_up"):
		velocity.y += -1
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
	position += velocity * delta





func _on_body_entered(body):
	hide()
	enemy_hit.play()
	b_gmusic.stop()
