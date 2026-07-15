import pygame
from pong_inverse.objets import Player
from pong_inverse.settings import BG_COLOR

class Game:
    def __init__(self, screen):
        self.screen = screen
        self.clock = pygame.time.Clock()
        self.running = True
        self.player = Player(100, 100)

    def run(self):
        while self.running:
            for event in pygame.event.get():
                if event.type == pygame.QUIT:
                    self.running = False
            self.update()
            self.draw()
            self.clock.tick(60)

    def update(self):
        self.player.update()

    def draw(self):
        self.screen.fill(BG_COLOR)
        self.player.draw(self.screen)
        pygame.display.flip()
