#include <SDL3/SDL.h>
#include <stdio.h>
#include <stdint.h>

#include "helper.h"

void computeDirectionToCursor(
    float playerX, float playerY,
    float cursorX, float cursorY,
    float *directionX, float *directionY
);

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
        while (SDL_PollEvent(&e))
        {
            if (e.type == SDL_EVENT_KEY_DOWN && e.key.key == SDLK_ESCAPE)
            {
                is_running = false;
            }
            if (e.type == SDL_EVENT_KEY_DOWN && e.key.key == SDLK_SPACE)
            {
                printf("debug\r\n");
            }
        }

        float directionX = 0.0f;
        float directionY = 0.0f;
        SDL_PumpEvents();
        const bool *keyboardState = SDL_GetKeyboardState(NULL);

        if ( keyboardState[SDL_GetScancodeFromKey(SDLK_Z, NULL )] ){
            directionY = -1.0f;
        }
        if ( keyboardState[SDL_GetScancodeFromKey(SDLK_Q, NULL )] ){
            directionX = -1.0f;
        }
        if ( keyboardState[SDL_GetScancodeFromKey(SDLK_S, NULL )] ){
            directionY = 1.0f;
        }
        if ( keyboardState[SDL_GetScancodeFromKey(SDLK_D, NULL )] ){
            directionX = 1.0f;
        }

        // Gestion de la souris
        float realCursorX;
        float realCursorY;
        SDL_GetMouseState(&realCursorX, &realCursorY);


        // Application du scale aux coordonnées de la souris
        float cursorX = realCursorX / (float)scale;
        float cursorY = realCursorY / (float)scale;


        computeDirectionToCursor(posPlayerX, posPlayerY, cursorX, cursorY, &directionX, &directionY);

        printf("-----------------------------\r\n");
        printf("cursorX %f | cursorY %f\r\n", cursorX, cursorY);
        printf("posPlayerX %f | posPlayerY %f\r\n", posPlayerX, posPlayerY);
        printf("directionX %f | directionY %f\r\n", directionX, directionY);
        /*
        float len = SDL_sqrtf(directionX*directionX + directionY*directionY);
        if (len > 0.0f) {
            directionX /= len;
            directionY /= len;
        }
        */
        // Déplacement du joueur basé sur le delta‑time
        posPlayerX += 60.0f * elapsed * directionX;
        posPlayerY += 60.0f * elapsed * directionY;

        printf("-----------------------------\r\n");


        // Efface le framebuffer
        clearFrameBuffer(0xffffff, framebuffer, width, height);


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

void computeDirectionToCursor(
    float playerX, float playerY,
    float cursorX, float cursorY,
    float *directionX, float *directionY
){
    // Calcul du vecteur entre le joueur et le curseur
    float dx = cursorX - playerX;
    float dy = cursorY - playerY;

    // Calcul de la longueur du vecteur
    float len = SDL_sqrtf(dx*dx + dy*dy);

    // Si la souris est exactement sur le joueur → pas de direction
    if (len == 0.0f) {
        *directionX = 0.0f;
        *directionY = 0.0f;
        return;
    }

    // Normalisation du vecteur (vitesse constante)
    *directionX = dx / len;
    *directionY = dy / len;

}

