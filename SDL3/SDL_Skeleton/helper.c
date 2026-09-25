#include "helper.h"

void clearFrameBuffer(uint32_t color, uint32_t *framebuffer, uint32_t length){
    for (uint32_t i=0; i<length; i++){
        framebuffer[i] = color;
    }
}
