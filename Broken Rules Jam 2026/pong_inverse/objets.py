import pygame

class Player:
    def __init__(self, x, y):
        self.x = x
        self.y = y
        self.size = 30
        self.color = (255, 0, 0)

    def update(self):
        pass  # Logique de mise à jour du joueur

    def draw(self, surface):
        pygame.draw.rect(surface, self.color, (self.x, self.y, self.size, self.size))
