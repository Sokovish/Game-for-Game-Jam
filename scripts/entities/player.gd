extends CharacterBody2D

const SPEED = 80.0 
@onready var anim = $AnimatedSprite2D 

var facing_direction = Vector2(0, 1) 

func _physics_process(_delta):
	var direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	
	if direction:
		velocity = direction * SPEED
		facing_direction = direction
	else:
		velocity = Vector2.ZERO

	update_animation(direction)
	move_and_slide()

func update_animation(direction):
	if direction == Vector2.ZERO:
		if facing_direction.x != 0:
			anim.flip_h = facing_direction.x < 0
			
		if facing_direction.y < 0: # CIMA
			if facing_direction.x != 0:
				anim.play("idle_up_side")
			else:
				anim.play("idle_up")
				
		elif facing_direction.y > 0: # BAIXO
			if facing_direction.x != 0:
				anim.play("idle_down_side")
			else:
				anim.play("idle_down")
				
		else: # LADOS
			anim.play("idle_side")

	else:
		# ===== ANDANDO =====
		
		# Espelhamento
		if direction.x != 0:
			anim.flip_h = direction.x < 0
			
		if direction.y < 0: # CIMA
			if direction.x != 0:
				anim.play("walk_up_side") 
			else:
				anim.play("walk_up")      
				
		elif direction.y > 0: # BAIXO
			if direction.x != 0:
				anim.play("walk_down_side") 
			else:
				anim.play("walk_down")      
				
		else: # LADOS
			anim.play("walk_side")
