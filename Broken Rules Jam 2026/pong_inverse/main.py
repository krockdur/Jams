import pygame
from game import Game
from settings import WIDTH, HEIGHT

def main():
    pygame.init()
    screen = pygame.display.set_mode((WIDTH, HEIGHT))
    pygame.display.set_caption("Mon Jeu Pygame")
    game = Game(screen)
    game.run()
    pygame.quit()

if __name__ == "__main__":
    main()
