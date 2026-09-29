#include <SDL3/SDL.h>
#include <stdio.h>
#include <stdint.h>

#include "helper.h"

int main()
{
    // Position du joueur (float pour mouvement fluide)
    float posPlayerX = 10.0f;
    float posPlayerY = 10.0f;

    SDL_Window* window = NULL;
    SDL_Renderer* renderer = NULL;
    SDL_Texture* texture = NULL;

    uint8_t scale = 4;

    // Taille de la grille de pixels (framebuffer logiciel)
    uint16_t width = 320;
    uint16_t height = 200;

    // Durée théorique d'une frame à 60 FPS
    const double target_frame = 1.0 / 60.0;

    // Framebuffer logiciel (rendu CPU)
    uint32_t framebuffer[width * height];

    // Initialisation de SDL
    if (!SDL_Init(SDL_INIT_VIDEO))
    {
        SDL_Log("SDL_Init failed: %s", SDL_GetError());
        return -1;
    }

    // Création fenêtre + renderer
    if (!SDL_CreateWindowAndRenderer(
            "SDL_Skeleton",
            width * scale,
            height * scale,
            SDL_WINDOW_RESIZABLE | SDL_WINDOW_HIGH_PIXEL_DENSITY,
            &window, &renderer))
    {
        SDL_Log("CreateWindowAndRenderer: %s", SDL_GetError());
        SDL_Quit();
        return -1;
    }

    bool is_running = true;

    // Texture dans laquelle on upload le framebuffer
    texture = SDL_CreateTexture(renderer,
                                SDL_PIXELFORMAT_XRGB8888,
                                SDL_TEXTUREACCESS_STREAMING,
                                width, height);

    SDL_SetTextureScaleMode(texture, SDL_SCALEMODE_NEAREST);

    // Delta‑time initial : toujours la valeur théorique
    double elapsed = target_frame;

    SDL_Event e;

    while (is_running)
    {
        // Début de la mesure du temps de frame
        uint64_t start = SDL_GetPerformanceCounter();

        // Gestion des événements
        uint8_t leftInput = 0;
        uint8_t rightInput = 0;
        uint8_t upInput = 0;
        uint8_t downInput = 0;
        while (SDL_PollEvent(&e))
        {
            if (e.type == SDL_EVENT_KEY_DOWN && e.key.key == SDLK_ESCAPE)
            {
                is_running = false;
            }
        }

        SDL_PumpEvents();
        const bool *keyboardState = SDL_GetKeyboardState(NULL);

        printf("%d", keyboardState[SDL_GetScancodeFromKey(SDLK_Z, NULL )]);
        printf("%d", keyboardState[SDL_GetScancodeFromKey(SDLK_Q, NULL)]);
        printf("%d", keyboardState[SDL_GetScancodeFromKey(SDLK_S, NULL)]);
        printf("%d", keyboardState[SDL_GetScancodeFromKey(SDLK_D, NULL)]);

        system("cls");
        //printf("INPUT : %d%d%d%dr\n", leftInput, rightInput, upInput, downInput);

        // Efface le framebuffer
        clearFrameBuffer(0xffffff, framebuffer, width, height);

        // Log debug
        //printf("elapsed : %f | posPlayerX : %f\r\n", elapsed, posPlayerX);

        // Déplacement du joueur basé sur le delta‑time
        posPlayerX += 30.0f * elapsed;

        // Dessin du joueur
        drawFilledCircle((uint16_t)posPlayerX,
                         (uint16_t)posPlayerY,
                         5,
                         width, height,
                         framebuffer,
                         0x56F5F3);

        // Upload du framebuffer dans la texture
        SDL_UpdateTexture(texture, NULL, framebuffer, width * sizeof(uint32_t));

        // Rendu SDL
        SDL_RenderClear(renderer);
        SDL_RenderTexture(renderer, texture, NULL, NULL);
        SDL_RenderPresent(renderer);

        // Fin de la mesure du temps de frame
        uint64_t end = SDL_GetPerformanceCounter();
        double frameTime = (double)(end - start) / (double)SDL_GetPerformanceFrequency();

        // Si la frame a été plus rapide que 60 FPS → on dort pour stabiliser
        if (frameTime < target_frame)
        {
            SDL_Delay((uint32_t)((target_frame - frameTime) * 1000.0));

            // IMPORTANT :
            // On fixe le delta‑time à la valeur théorique.
            // Cela évite les sauts et garantit un mouvement constant.
            elapsed = target_frame;
        }
        else
        {
            // Si la frame est plus lente → on utilise le vrai temps
            elapsed = frameTime;
        }
    }

    // Nettoyage SDL
    SDL_DestroyTexture(texture);
    SDL_DestroyRenderer(renderer);
    SDL_DestroyWindow(window);

    return 0;
}
