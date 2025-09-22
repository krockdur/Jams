/*
    Little JS Hello World Demo
    - Just prints "Hello World!"
    - A good starting point for new projects
*/

'use strict';

const game_area = vec2(400, 400);


class Player extends EngineObject 
{
    constructor(pos)
    {
        
        super( pos );
        // setup object
        //console.log(pos);
        this.p_pos = pos;

    }

    update()
    {
        // update object physics and position

        this.p_pos = mousePos;

        if (mouseIsDown(0))
        {
            console.log("Click gauche");
        }

        if (mouseIsDown(1))
        {
            console.log("Click milieu");
        }

        if (mouseIsDown(2))
        {
            console.log("Click droit");
        }

        super.update(); 
    }

    render()
    {
        // draw object as a sprite
        drawRect( this.p_pos, vec2(10, 10));

        super.render();
    }
}


///////////////////////////////////////////////////////////////////////////////
function gameInit()
{
    canvasFixedSize = game_area;
    
    cameraPos = vec2(0, 0); //top left
    cameraScale = 1;
    new Player(vec2(10, 0))
}

///////////////////////////////////////////////////////////////////////////////
function gameUpdate()
{
    // called every frame at 60 frames per second
    // handle input and update the game state
}

///////////////////////////////////////////////////////////////////////////////
function gameUpdatePost()
{
    // called after physics and objects are updated
    // setup camera and prepare for render
}

///////////////////////////////////////////////////////////////////////////////
function gameRender()
{
    //drawLine( vec2(-50,50), vec2(50,0), 1 );
    drawLine( vec2(0, 0), vec2(0, 500), 1,  new Color(1, 0, 0) );
    drawLine( vec2(0, 0), vec2(500, 0), 1,  new Color(1, 0, 0) );
    
}

///////////////////////////////////////////////////////////////////////////////
function gameRenderPost()
{
    //drawRect( vec2(0, 0), vec2(5, 10) );
}

///////////////////////////////////////////////////////////////////////////////
// Startup LittleJS Engine
engineInit(gameInit, gameUpdate, gameUpdatePost, gameRender, gameRenderPost);