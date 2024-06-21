import pygame
import sys

pygame.init()

# Определяем константы для цветов
BLACK = (0, 0, 0)
WHITE = (255, 255, 255)

# Создаем окно игры
screen = pygame.display.set_mode((800, 600))
pygame.display.set_caption("Katana ZERO Clone")

# Создаем класс для игрового персонажа
class Player(pygame.sprite.Sprite):
    def __init__(self):
        super().__init__()
        self.image = pygame.Surface((50, 50))
        self.image.fill(WHITE)
        self.rect = self.image.get_rect()
        self.rect.center = (400, 300)

    def update(self):
        keys = pygame.key.get_pressed()
        if keys[pygame.K_LEFT]:
            self.rect.x -= 5
        if keys[pygame.K_RIGHT]:
            self.rect.x += 5
        if keys[pygame.K_UP]:
            self.rect.y -= 5
        if keys[pygame.K_DOWN]:
            self.rect.y += 5

# Создаем группу спрайтов и добавляем в нее игрового персонажа
all_sprites = pygame.sprite.Group()
player = Player()
all_sprites.add(player)

# Основной игровой цикл
clock = pygame.time.Clock()
running = True
while running:
    for event in pygame.event.get():
        if event.type == pygame.QUIT:
            running = False

    # Обновляем игровые объекты
    all_sprites.update()

    # Отрисовываем все спрайты
    screen.fill(BLACK)
    all_sprites.draw(screen)

    # Обновляем экран
    pygame.display.flip()

    # Ограничиваем FPS
    clock.tick(60)

pygame.quit()
sys.exit()
