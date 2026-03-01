vida = 5;
//velh = 2;
alarme = noone;

//fazer o rato andar de um lado para o outro flipando sua sprite de acordo
//fazer o player atacar quando o player se aproxima dele



//controlando o dano dado ao player
atingiu_player = false;
pode = game_get_speed(gamespeed_fps);
timer_dano = 0;





#region movimento //codigo da raquete pra adiantar a vida:
direcao = 1; 

//para esse objeto funcionar, eu devo colocar um x_max e um x_min no variable definition.
//basta mandar o objeto se mover dentro desse range.
//cada plataforma móvel criada tem seu próprio range
//também dá pra personalizar as velocidades delas no variable definitions

movimento = function()
{
    hspeed = velh * direcao;
    
    if (x >= x_max)
    {
        direcao = -1;
        image_xscale = -1;
    }
    else if (x <= x_min) 
    {
        direcao = 1;	
        image_xscale = 1;
    }
    

}
#endregion




#region Ataque

//fazendo ele detectar o player
positivo = false;

deixa_pra_atacar = function()
{
    if (instance_exists(obj_player))
    {
        var _xplayer, _yplayer
        _xplayer = instance_nearest(x, y, obj_player).x
        _yplayer = instance_nearest(x, y, obj_player).y
        alarme = point_distance(x, y, _xplayer, _yplayer);
    }
}


//criando a reação do ratinho ao ver o player
estado = noone;


//instance_nearest()

atacando = function()
{
    if (instance_exists(obj_player))
    {
        positivo = true;
        
        if (x < obj_player.x)
        {
            image_xscale = 1;
            direcao = image_xscale;
        }
        else {
        	image_xscale = -1;
            direcao = image_xscale;
        }
        
        hspeed = 0;
        sprite_index = spr_medusa_attack;
        audio_play_sound(sfx_medusa, 4, false);
        
    }
        
}

#endregion