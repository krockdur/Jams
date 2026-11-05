#ifndef HELPER_H_INCLUDED
#define HELPER_H_INCLUDED

#include <stdint.h>
#include <stdio.h>
#include <math.h>

typedef struct {
    float x;      // position X du coin supérieur gauche
    float y;      // position Y du coin supérieur gauche
    float w;      // largeur
    float h;      // hauteur
} Rect;

bool rectIntersect(const Rect *a, const Rect *b);

/**
efface la grille du monde :
color           couleur au format 0xRRGGBBAA
framebuffer     grille du monde
canvasWidth     largeur de la grille du monde
canvasHeight    hauteur de la grille du monde
**/
void clearFrameBuffer(uint32_t color, uint32_t *framebuffer, uint16_t canvasWidth, uint16_t canvasHeight);

/**
Déssine un pixel :
posx            position en x sur la grille
posy            position en y sur la grille
canvasWidth     largeur de la grille du monde
canvasHeight    hauteur de la grille du monde
framebuffer     grille du monde
color           couleur au format 0xRRGGBBAA
**/
void drawPixel(uint16_t posx, uint16_t posy, uint16_t canvasWidth, uint16_t canvasHeight, uint32_t *framebuffer, uint32_t color);

/**
Déssine un rectangle :
posx            position en x sur la grille
posy            position en y sur la grille
sizex           largeur du rectangle
sizey           hauteur du rectangle
canvasWidth     largeur de la grille du monde
canvasHeight    hauteur de la grille du monde
framebuffer     grille du monde
color           couleur au format 0xRRGGBBAA
**/
void drawFilledSquare(uint16_t posx, uint16_t posy, uint16_t sizex, uint16_t sizey, uint16_t canvasWidth, uint16_t canvasHeight, uint32_t *framebuffer, uint32_t color);

/**
drawLine : Déssine une ligne :
uint16_t posXstart          point de départ de la ligne en X
uint16_t posYstart          point de départ de la ligne en Y
uint16_t posXend            point d'arrivé de la ligne en X
uint16_t posYend            point d'arrivé de la ligne en Y
uint16_t canvasWidth        largeur de la grille du monde
uint16_t canvasHeight       hauteur de la grille du monde
uint32_t framebuffer        grille du monde
uint32_t color              couleur au format 0xRRGGBBAA
**/
void drawLine( uint16_t x0, uint16_t y0, uint16_t x1, uint16_t y1, uint16_t canvasWidth, uint16_t canvasHeight, uint32_t *framebuffer, uint32_t color);

/**
drawCircle : Déssine un cercle :
uint16_t cx             centtre du cercle en X
uint16_t cy             centre du cercle en Y
uint16_t radius         rayon
uint16_t canvasWidth    largeur de la grille du monde
uint16_t canvasHeight   hauteur de la grille du monde
uint32_t framebuffer    grille du monde
uint32_t color          couleur au format 0xRRGGBBAA
**/
void drawCircle( uint16_t cx, uint16_t cy, uint16_t radius, uint16_t canvasWidth, uint16_t canvasHeight, uint32_t *framebuffer, uint32_t color );

/**
fillCircle : Déssine un cercle plein :
uint16_t cx             centtre du cercle en X
uint16_t cy             centre du cercle en Y
uint16_t radius         rayon
uint16_t canvasWidth    largeur de la grille du monde
uint16_t canvasHeight   hauteur de la grille du monde
uint32_t framebuffer    grille du monde
uint32_t color          couleur au format 0xRRGGBBAA
**/
void drawFilledCircle( uint16_t cx, uint16_t cy, uint16_t radius, uint16_t canvasWidth, uint16_t canvasHeight, uint32_t *framebuffer, uint32_t color);

#endif // HELPER_H_INCLUDED
