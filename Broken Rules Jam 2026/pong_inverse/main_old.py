"""
PONG INVERSE – BROKEN RULES JAM
--------------------------------
Concept :
- Deux trous remplacent les raquettes.
- Chaque trou tente d'aspirer la balle.
- La taille des trous est aléatoire.
- La vitesse de la balle est anarchique.
- La vitesse des trous est anarchique.
- Le rebond de la balle est imprévisible.
- Aucun graphisme importé : uniquement pygame.draw.

Règle brisée :
- Dans Pong, on renvoie la balle.
- Ici, on essaie de la capturer.

Objectif :
- Créer un gameplay chaotique mais lisible.
"""

import pygame
import random

# --- CONFIG ---
WIDTH, HEIGHT = 1280, 720
FPS = 60

# --- INITIALISATION ---
pygame.init()
screen = pygame.display.set_mode((WIDTH, HEIGHT))
pygame.display.set_caption("Pong Inversé – Prototype")
clock = pygame.time.Clock()

# --- VARIABLES DE JEU ---
ball_pos = [WIDTH // 2, HEIGHT // 2]
ball_vel = [random.uniform(-5, 5), random.uniform(-5, 5)]
ball_radius = 12

# Trous (gauche et droite)
holes = [
    {"x": 50, "y": HEIGHT // 2, "r": random.randint(40, 90), "vy": random.uniform(-3, 3)},
    {"x": WIDTH - 50, "y": HEIGHT // 2, "r": random.randint(40, 90), "vy": random.uniform(-3, 3)}
]

# --- BOUCLE DE JEU ---
running = True
while running:
    # 1) ÉVÉNEMENTS
    for event in pygame.event.get():
        if event.type == pygame.QUIT:
            running = False

    # 2) LOGIQUE DU JEU

    # Déplacement anarchique de la balle
    ball_pos[0] += ball_vel[0]
    ball_pos[1] += ball_vel[1]

    # Rebonds anarchiques
    if ball_pos[1] <= 0 or ball_pos[1] >= HEIGHT:
        ball_vel[1] *= -1 * random.uniform(0.8, 1.2)

    if ball_pos[0] <= 0 or ball_pos[0] >= WIDTH:
        ball_vel[0] *= -1 * random.uniform(0.8, 1.2)

    # Déplacement anarchique des trous
    for hole in holes:
        hole["y"] += hole["vy"]

        # rebond vertical
        if hole["y"] - hole["r"] <= 0 or hole["y"] + hole["r"] >= HEIGHT:
            hole["vy"] *= -1

    # 3) DESSIN
    screen.fill("black")

    # Balle
    pygame.draw.circle(screen, "white", ball_pos, ball_radius)

    # Trous
    for hole in holes:
        pygame.draw.circle(screen, "purple", (hole["x"], hole["y"]), hole["r"], width=4)

    # 4) AFFICHAGE
    pygame.display.flip()
    clock.tick(FPS)

pygame.quit()
