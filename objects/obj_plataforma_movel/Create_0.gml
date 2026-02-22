//variaveis de movimento
//vel = 3;
direcao = 1; 

//para esse objeto funcionar, eu devo colocar um x_max e um x_min no variable definition.
//basta mandar o objeto se mover dentro desse range.
//cada plataforma móvel criada tem seu próprio range
//também dá pra personalizar as velocidades delas no variable definitions

movimento = function()
{
    x += velh * direcao;
    
    if (x >= x_max)
    {
        direcao = -1;
    }
    else if (x <= x_min) 
    {
        direcao = 1;	
    }
}

leva_player = function()
{
    with (obj_player)
{
    if (place_meeting(x, y + 1, other))
    {
        x += obj_plataforma_movel.velh * obj_plataforma_movel.direcao;
    }
}
}