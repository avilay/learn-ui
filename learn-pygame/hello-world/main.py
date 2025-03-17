import asyncio
import pygame


pygame.init()
pygame.display.set_mode((32, 240))
clock = pygame.time.Clock()


async def main():
    count = 60

    while True:
        print(f"{count}: Hello from pygame")
        pygame.display.update()
        await asyncio.sleep(0)

        if not count:
            pygame.quit()
            return

        count -= 1
        clock.tick(60)


asyncio.run(main())
