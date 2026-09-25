#ifndef HELPER_H_INCLUDED
#define HELPER_H_INCLUDED

#include <stdint.h>

void clearFrameBuffer(uint32_t color, uint32_t *framebuffer, uint32_t length);
void drawPixel(uint16_t posx, uint16_t posy, uint16_t canvasWidth, uint16_t canvasHeight, uint32_t *framebuffer, uint32_t color);
void drawSquare(uint16_t posx, uint16_t posy, uint16_t sizex, uint16_t sizey, uint16_t canvasWidth, uint16_t canvasHeight, uint32_t *framebuffer, uint32_t color);

#endif // HELPER_H_INCLUDED
