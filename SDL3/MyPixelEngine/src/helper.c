#include "helper.h"

void clearFrameBuffer(uint32_t color, uint32_t *framebuffer, uint16_t canvasWidth, uint16_t canvasHeight){

    uint32_t length = canvasWidth*canvasHeight;

    for ( uint32_t i = 0; i < length; i++ ){
        framebuffer[i] = color;
    }

}

void drawPixel(uint16_t posx, uint16_t posy, uint16_t canvasWidth, uint16_t canvasHeight, uint32_t *framebuffer, uint32_t color){
    framebuffer[canvasWidth * posy + posx] = color;
}

void drawFilledSquare(uint16_t posx, uint16_t posy, uint16_t sizex, uint16_t sizey, uint16_t canvasWidth, uint16_t canvasHeight, uint32_t *framebuffer, uint32_t color ){
    uint32_t topLeftIndex = canvasWidth * posy + posx;

    for ( uint32_t y = 0; y < sizey; y++){

        uint32_t leftIndex = topLeftIndex + y * canvasWidth;

        for (uint32_t x = leftIndex; x < leftIndex + sizex; x++){

            framebuffer[x] = color;

        }

    }
}

void drawLine( uint16_t x0, uint16_t y0, uint16_t x1, uint16_t y1, uint16_t canvasWidth, uint16_t canvasHeight, uint32_t *framebuffer, uint32_t color){
    // Calcul de la diff�rence horizontale entre les deux points
    int dx = (int)x1 - (int)x0;
    if (dx < 0) dx = -dx;   // Valeur absolue de dx

    // Calcul de la diff�rence verticale entre les deux points
    int dy = (int)y1 - (int)y0;
    if (dy < 0) dy = -dy;   // Valeur absolue de dy
    dy = -dy;               // Bresenham utilise dy n�gatif pour simplifier les calculs

    // D�termination du sens de d�placement horizontal
    int sx;
    if (x0 < x1) sx = 1;    // On avance vers la droite
    else sx = -1;           // On avance vers la gauche

    // D�termination du sens de d�placement vertical
    int sy;
    if (y0 < y1) sy = 1;    // On avance vers le bas
    else sy = -1;           // On avance vers le haut

    // Erreur initiale : combinaison des �carts horizontaux et verticaux
    int err = dx + dy;

    // Boucle principale : on trace jusqu'� atteindre le point final
    while (1)
    {
        // V�rification des bornes avant d'�crire dans le framebuffer
        if (x0 < canvasWidth && y0 < canvasHeight)
            framebuffer[y0 * canvasWidth + x0] = color;

        // Si on a atteint le point final, on arr�te
        if (x0 == x1 && y0 == y1)
            break;

        // Double de l�erreur : utilis� pour d�cider du prochain d�placement
        int e2 = 2 * err;

        // D�placement horizontal si l�erreur le permet
        if (e2 >= dy) {
            err += dy;
            x0 += sx;
        }

        // D�placement vertical si l�erreur le permet
        if (e2 <= dx) {
            err += dx;
            y0 += sy;
        }
    }
}

void drawCircle( uint16_t cx, uint16_t cy, uint16_t radius, uint16_t canvasWidth, uint16_t canvasHeight, uint32_t *framebuffer, uint32_t color){
    int x = radius;
    int y = 0;
    int err = 1 - x;  // erreur initiale (Midpoint)

    while (x >= y)
    {
        // Chaque point est dessin� dans les 8 octants du cercle
        if (cx + x < canvasWidth && cy + y < canvasHeight)
            framebuffer[(cy + y) * canvasWidth + (cx + x)] = color;

        if (cx + y < canvasWidth && cy + x < canvasHeight)
            framebuffer[(cy + x) * canvasWidth + (cx + y)] = color;

        if (cx - y < canvasWidth && cy + x < canvasHeight && cx >= y)
            framebuffer[(cy + x) * canvasWidth + (cx - y)] = color;

        if (cx - x < canvasWidth && cy + y < canvasHeight && cx >= x)
            framebuffer[(cy + y) * canvasWidth + (cx - x)] = color;

        if (cx - x < canvasWidth && cy - y < canvasHeight && cx >= x && cy >= y)
            framebuffer[(cy - y) * canvasWidth + (cx - x)] = color;

        if (cx - y < canvasWidth && cy - x < canvasHeight && cx >= y && cy >= x)
            framebuffer[(cy - x) * canvasWidth + (cx - y)] = color;

        if (cx + y < canvasWidth && cy - x < canvasHeight && cy >= x)
            framebuffer[(cy - x) * canvasWidth + (cx + y)] = color;

        if (cx + x < canvasWidth && cy - y < canvasHeight && cy >= y)
            framebuffer[(cy - y) * canvasWidth + (cx + x)] = color;

        // Algorithme Midpoint Circle
        y++;

        if (err < 0) {
            err += 2 * y + 1;
        } else {
            x--;
            err += 2 * (y - x + 1);
        }
    }
}

void drawFilledCircle( uint16_t cx, uint16_t cy, uint16_t radius, uint16_t canvasWidth, uint16_t canvasHeight, uint32_t *framebuffer, uint32_t color){
    int x = radius;
    int y = 0;
    int err = 1 - x;   // erreur initiale (Midpoint)

    while (x >= y)
    {
        // --- Pour chaque "ligne" horizontale du cercle ---
        // On dessine des segments entre les points sym�triques

        // Ligne horizontale en haut
        if (cy + y < canvasHeight) {
            int start = cx - x;
            if (start < 0) start = 0;

            int end = cx + x;
            if (end >= canvasWidth) end = canvasWidth - 1;

            for (int px = start; px <= end; px++) {
                framebuffer[(cy + y) * canvasWidth + px] = color;
            }
        }

        // Ligne horizontale en bas
        if (cy - y < canvasHeight && cy >= y) {
            int start = cx - x;
            if (start < 0) start = 0;

            int end = cx + x;
            if (end >= canvasWidth) end = canvasWidth - 1;

            for (int px = start; px <= end; px++) {
                framebuffer[(cy - y) * canvasWidth + px] = color;
            }
        }

        // Ligne horizontale � gauche et droite (pour x >= y)
        if (cy + x < canvasHeight) {
            int start = cx - y;
            if (start < 0) start = 0;

            int end = cx + y;
            if (end >= canvasWidth) end = canvasWidth - 1;

            for (int px = start; px <= end; px++) {
                framebuffer[(cy + x) * canvasWidth + px] = color;
            }
        }

        if (cy - x < canvasHeight && cy >= x) {
            int start = cx - y;
            if (start < 0) start = 0;

            int end = cx + y;
            if (end >= canvasWidth) end = canvasWidth - 1;

            for (int px = start; px <= end; px++) {
                framebuffer[(cy - x) * canvasWidth + px] = color;
            }
        }

        // --- Algorithme Midpoint Circle ---
        y++;

        if (err < 0) {
            err += 2 * y + 1;
        } else {
            x--;
            err += 2 * (y - x + 1);
        }
    }
}




bool rectIntersect(const Rect *a, const Rect *b)
{
    if (a->x + a->w < b->x) return false;
    if (a->x > b->x + b->w) return false;
    if (a->y + a->h < b->y) return false;
    if (a->y > b->y + b->h) return false;

    return true;
}
