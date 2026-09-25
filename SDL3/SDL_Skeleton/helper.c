#include "helper.h"

void clearFrameBuffer(uint32_t color, uint32_t *framebuffer, uint32_t length){
    for (uint32_t i=0; i<length; i++){
        framebuffer[i] = color;
    }
}


void drawPixel(uint16_t posx, uint16_t posy, uint16_t canvasWidth, uint16_t canvasHeight, uint32_t *framebuffer, uint32_t color){
    framebuffer[ canvasWidth * posx + posy] = color;
}


void drawSquare(uint16_t posx, uint16_t posy, uint16_t sizex, uint16_t sizey, uint16_t canvasWidth, uint16_t canvasHeight, uint32_t *framebuffer, uint32_t color){
    uint16_t topLeft = width * posx + posy
}
