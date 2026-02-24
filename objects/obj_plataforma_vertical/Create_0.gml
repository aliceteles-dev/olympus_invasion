//variaveis de movimento

direcao = 1; 


movimento = function()
{
    y += velv * direcao;
    
    if (y >= y_max)
    {
        direcao = -1;
    }
    else if (y <= y_min) 
    {
        direcao = 1;	
    }
}

leva_player = function()
{
    with (obj_player)
    {
        if (place_meeting(x, bbox_bottom + 10, other)) 
        {
            y += other.velv * other.direcao;
        }
    }
}