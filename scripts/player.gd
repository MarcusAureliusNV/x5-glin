extends CharacterBody2D

const SPEED = 130.0
const JUMP_VELOCITY = -300.0

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var hp = 3

# Constantes para rodar
var is_rolling = false
var roll_timer = 0.5  # segundos
var roll_duration = 0.5
var roll_speed = 220

# Variable para que se quede tieso cuando muere:
var is_dead = false

# Los @onready nos da acceso a los distintos nodos dentro de la escena Player.
@onready var animated_sprite = $AnimatedSprite2D
@onready var notifDmg = $notifDmg

# Accede al script de GameManager para ejecutar lógicas como la muerte.
@onready var game_manager = %GameManager

func _physics_process(delta):
	
	if is_dead:
		return
		
	collision_layer = 2
	collision_mask = 1

	# Añadir gravedad
	if not is_on_floor():
		velocity.y += gravity * delta

	# Manejo de salto
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Obtener dirección de movimiento: -1, 0, 1
	var direction = Input.get_axis("move_left", "move_right")

	# Invertir el sprite según la dirección
	if direction > 0:
		animated_sprite.flip_h = false
	elif direction < 0:
		animated_sprite.flip_h = true

	# Si estamos rodando, reproducimos animación y reducimos el temporizador
	if is_rolling:
		animated_sprite.play("roll")
		roll_timer -= delta
		if roll_timer <= 0:
			is_rolling = false
		collision_layer = 1  # Desactivar las colisiones durante el roll
		collision_mask = 1
		move_and_slide()  # Asegurarse de mover al personaje
		return

	# Al presionar Shift (una sola vez) para rodar
	if Input.is_action_just_pressed("roll") and is_on_floor() and velocity.x != 0:
		is_rolling = true
		roll_timer = roll_duration
		collision_layer = 1  # Desactivar las colisiones durante el roll
		collision_mask = 1
		return

	# Animaciones normales
	if is_on_floor():
		if direction == 0:
			animated_sprite.play("idle")
		else:
			animated_sprite.play("run")
	else:
		animated_sprite.play("jump")

	# Aplicar movimiento
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	# Mover al personaje
	move_and_slide()

# Funciones de muerte y daño
func _on_hitbox_body_entered(body):
	if body.is_in_group("Enemy"):  
		take_damage(1)

# Reducir la vida al recibir daño
func take_damage(damage):
	if is_dead:
		return

	hp -= damage
	game_manager.hpAct = hp
	game_manager.rem_hp()


	if hp <= 0:
		die()

func die():
	is_dead = true
	animated_sprite.play("death")
