#include <SDL3/SDL.h>
#include <stdio.h>
#include <stdint.h>

#include "helper.h"

int main()
{

    SDL_Window* window = NULL;
    SDL_Renderer* renderer = NULL;
    SDL_Texture* texture = NULL;

    uint8_t scale = 3;

    uint16_t width = 320;
    uint16_t height = 200;
    const double target_frame = 1.0 / 60.0;

    uint32_t framebuffer[width * height];


    if (!SDL_Init( SDL_INIT_VIDEO ))
    {
		SDL_Log( "SDL_Init failed: %s", SDL_GetError() );
        return -1;
    }


    if( !SDL_CreateWindowAndRenderer( "SDL_Skeleton", width * scale, height * scale, SDL_WINDOW_RESIZABLE | SDL_WINDOW_HIGH_PIXEL_DENSITY, &window, &renderer ))
    {
        SDL_Log( "CreateWindowAndRenderer: %s", SDL_GetError() );
        SDL_Quit();
        return -1;
    }

    clearFrameBuffer(0xffffff, framebuffer, width*height);

    drawPixel(30, 5, width, height, framebuffer, 0xff0000);

    bool is_running = true;

    texture = SDL_CreateTexture( renderer, SDL_PIXELFORMAT_XRGB8888 , SDL_TEXTUREACCESS_STREAMING, width, height );
    SDL_SetTextureScaleMode(texture, SDL_SCALEMODE_NEAREST);

    SDL_Event e;
    while (is_running)
    {
        uint64_t start = SDL_GetPerformanceCounter();

        while (SDL_PollEvent( &e ))
        {
            if (e.type == SDL_EVENT_KEY_DOWN && e.key.key == SDLK_ESCAPE)
            {
                is_running = false;
                printf( "key down" );
            }

        }

        SDL_UpdateTexture(texture, NULL, framebuffer, width * sizeof(uint32_t));

        SDL_RenderClear( renderer );
        SDL_RenderTexture(renderer, texture, NULL, NULL);
        SDL_RenderPresent( renderer );

        uint64_t end = SDL_GetPerformanceCounter();
        double elapsed = (double)(end - start) / (double)SDL_GetPerformanceFrequency();
        if (elapsed < target_frame) {
          SDL_Delay((uint32_t)((target_frame - elapsed) * 1000.0));
        }
    }




    SDL_DestroyTexture( texture );
    SDL_DestroyRenderer( renderer );
    SDL_DestroyWindow( window );


    return 0;
}
