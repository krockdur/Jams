#ifndef OBJECTS_H
#define OBJECTS_H

#include <stdint.h>

typedef struct {
    float x;
    float y;
    float vx;
    float vy;

    float w;
    float h;

    uint32_t color;
} GameObject;

#endif
