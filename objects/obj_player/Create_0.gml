//mapeamento dos botões
keyboard_set_map(ord("A"), vk_left);
keyboard_set_map(ord("D"), vk_right);
keyboard_set_map(vk_up, vk_space);


#region Variáveis 
vida = 3;

//invencibilidade do player após tomar dano
tempo_inv = game_get_speed(gamespeed_fps);
timer_inv = 2;


//definindo com qwem o player vai colidir
var _tile1 = layer_tilemap_get_id("tl_cidade");
var _tile2 = layer_tilemap_get_id("tl_nuvens");
solidos = [obj_parede, obj_plataforma_movel, obj_plataforma_vertical, _tile1, _tile2];

//quem o player pode acertar?
inimigos = [obj_rato];

//controle
estou_no_chao       = false;
estou_na_plat_movel = false;
atacando            = false;
atirei              = false;
direcao             = 0; //essa aq decide pra onde o golpe do player vai 
pulei               = false;

//movimento
velh = 0;
max_velh = 3;
velv = 0;
max_velv = 3.5;
g = .2;


//variaveis de input do player
direita = false;
esquerda = false;
pular = false;
golpe = false;

//controle das sprites
estado = "idle";

#endregion


#region Métodos
inputs_player = function()
{
    direita     = keyboard_check(vk_right);
    esquerda    = keyboard_check(vk_left);
    pular       = keyboard_check(vk_space);
    golpe       = keyboard_check_pressed(ord("F"));
}

//tentando controlar o pulo do player
//checando_se_pulei = function()
//{
    //var _jump_cooldown = game_get_speed(gamespeed_fps) * 200
    //if (pular)
    //{
        //pulei = true * _jump_cooldown;
        //
    //}
    //else 
    //{
    	//pulei = false;
    //}
//}
//deu errado


movimento = function()
{
    timer_inv--; 
    
    //lo´gica do movimento horizontal
    velh = (direita - esquerda) * max_velh;
    
    //aplicando essa lógica e cuidando da colisão
    move_and_collide(velh, 0, solidos, 24);
    
    //movimento do eixo y
    move_and_collide(0, velv, solidos, 24);
    
    //x = round(x);
    
    //também quero que o player colida com a plataforma móvel
    //move_and_collide(0, 0, obj_plataforma_movel, 12);
    //checando_se_pulei();
   
    
    
     if (place_meeting(x, y + velv, solidos))
    {
        while (!place_meeting(x, y + sign(velv), solidos))
        {
            y += sign(velv);
        }
    
        if (velv > 0)  // só quando está caindo
        {
            velv = 0;
        }
}
    
    if (!estou_no_chao)
    {
        velv += g;
        //pulei = true;
    }
    
    
    y = clamp(y, 0 + sprite_height, room_height + 100);
    //else if (estou_no_chao)
    //{
        //velv = 0;
    //}

     //pulei = false;
    //if (estou_na_plat_movel)
    //{
        //velv = 0;
        //velv -= pular * max_velv;	
    //}
}

//sera que se eu usar a bbox_bottom do player mais top da plataforma isso faria a plataforma funcionar melhor
pulando = function()
{
    if (estou_no_chao and pular and !pulei)
    {
        //velv -= pular * max_velv;
       // y = round(y);
        //pulei = false;
        velv -= max_velv;
        pulei = true;
    }

    if (!pular)
    {
        pulei = false;
    }
    
}

tocando_chao = function()
{
    if (place_meeting(x, y + 1, solidos))
    {
        estou_no_chao = true;
    }
    else 
    {
        estou_no_chao = false;	
    }
}



estou_na_plataforma = function()
{
    estou_na_plat_movel = place_meeting(x, y + 1, obj_plataforma_movel);
}


inicia_ataque = function()
{
    if(golpe)
    {
        atacando = true;
    }    
}

perde_vida = function()
{
	if timer_inv > 0 return;
	
	if (vida > 1)
	{
		vida--;	
        timer_inv = tempo_inv;
    }
    else
    {
        instance_destroy();
    }

}



lutar = function()
{
   if (atacando)
    {

        var _local_de_saida = 0
        
        //tentnado consertar o mal posicionamento da sprite do golpe quando ela é criada
        if (estado == "fight_right")
        {
            _local_de_saida = x + 10;
        }
        else if (estado == "fight_left")
        {
            _local_de_saida = x - 10;
        }
        
        //substitui x+10 por _local_de_saidaa
        var _particula = instance_create_layer(_local_de_saida, y - 15, "golpe", obj_golpe_player);
        _particula.hspeed = 2 * direcao;
        
        atacando = false;
        //problema aqui, fica feio quando ele golpeia pra esquerda
            
            //atacando = false;
            //if (instance_exists(inimigos))
            //{
                //other.vida--;
            //}
            
            //golpe = false;
    }
    
   // atacando = false;
}


//fazendo ele se deixar levar pela plataforma móvel
//estou_na_plat_movel = function()
//{
    //with(obj_plataforma_movel)   
    //{
        //if (place_meeting(x, y + 1, obj_plataforma_movel))
        //{
            //obj_player.velh = obj_plataforma_movel.velh;
        //}
    //}
//}
//vamos tntar codar isso na plataforma

desenha_vida = function(_guiy = (-display_get_gui_height()) + display_get_gui_height(), _guix = (-display_get_gui_height()) + display_get_gui_height())
{
    repeat(vida)
    {
       // draw_get_valign()
       // var _guix, _guiy;
       // _guix = (-display_get_gui_height()) + display_get_gui_height();
       // _guiy = (-display_get_gui_width()) + display_get_gui_width();
        draw_sprite(spr_vida, 0, _guix + 30, _guiy + 30);
      //  draw_set_halign(fa_right) 
        _guix += 35;
        
    }
    
    _guix += 20; 
}

#endregion


//controlando sprites do player
animacoes = function()
{
    switch(estado)
    {
        case "idle":
            
            direcao = 1;
            
            if (golpe)
            {
                estado = "fight_right";
            }
            
            if (velh == 0 and velv == 0)
            {
                sprite_index = spr_player_idle_right;
            }
            
            if (velh > 0)
            {
                estado = "right"
            }
            else if (velh < 0)
            {
            	estado = "left"
            }
            
            if (velv != 0)
            {
                estado = "jump_right";
            }
            
            
        break;
    
    
    
        case "idle_left":
            
            direcao = -1;
            
            if (golpe)
            {
                estado = "fight_left";
            }
            
            
            if (velh == 0 and velv == 0)
            {
                sprite_index = spr_player_idle_left;
            }
            
            if (velh > 0)
            {
                estado = "right"
            }
            else if (velh < 0)
            {
            	estado = "left"
            }
            
            if (velv != 0)
            {
                estado = "jump_left";
            }
            
            
            
        break;
    
        case "right":
            
            direcao = 1;
            
            if (golpe)
            {
                estado = "fight_right";
                image_index = 0;
            }
            
            sprite_index = spr_player_right;
            if (velh == 0)
            {
                estado = "idle";
            }
            else if (velh < 0)
            {
                estado = "left";
            }
            
            if (velv != 0)
            {
                estado = "jump_right";
            }
            
        break;
    
    
        case "left":
            
            direcao = -1;
            
            if (golpe)
            {
                estado = "fight_left";
            }
            
            sprite_index = spr_player_left;
            
            if (velh == 0)
            {
                estado = "idle_left";
            }
            else if (velh > 0)
            {
                estado = "right";
            }
            
            if (velv != 0)
            {
                estado = "jump_left";
            }
            
        break;       
    
    
        case "jump_right":
            
            direcao = 1;
            
            if (golpe)
            {
                estado = "fight_right";
            }
            
            sprite_index = spr_player_jump_right;
            image_index = 1;
            
            if (velv == 0)
            {
                estado = "idle";
            }
            
            if (velv != 0 and velh < 0)
            {
                estado = "jump_left";
            }
            
        break;
    
    
        case "jump_left":
            
            direcao = -1;
            
            if (golpe)
            {
                estado = "fight_left";
                
            }
            
            sprite_index = spr_player_jump_left;
            image_index = 1;
            
            if (velv == 0)
            {
                estado = "idle_left";
            }
            
            if (velv != 0 and velh > 0)
            {
                estado = "jump_right";
            }
            
        break;
            
    
        case "fight_right":
            
            sprite_index = spr_player_fight_right;
            image_speed = 1;
            
            lutar();
            
            //if (image_index >= image_number - 1)
            //{
                //atacando = false;
                //image_index = 0;
                //estado = "idle"; 
            //}
            //if (sprite_index == 0)
            //{
                //lutar();
            //}
            //image_index += 0.25;

            //if (image_index >= 0)
            //{
                //lutar();
            //}
            
            
            if (image_index > image_number - 1)
            {
                
               // atacando = false;
                
                if (velh == 0)
                {
                    estado = "idle"
                }
                else if (velh > 0)
                {
                    estado = "right"
                }
                else {
                	estado = "left"
                }
            }
            
        break;
    
    
        case "fight_left":
            
            image_speed = 1;
            sprite_index = spr_player_fight_left;
            
            lutar();
            //atacando = true;
            
            //if(image_index <= 0)
            //{
                //lutar();
                ////image_speed = 1;
            //}
            
           // image_speed = 1; 
            //direcao = -1;
            //lutar();
            
            if (image_index >= image_number - 1)
            {
                
               // atacando = false;
                
                if (velh == 0)
                {
                    estado = "idle_left"
                }
                else if (velh > 0)
                {
                    estado = "right"
                }
                else {
                	estado = "left"
                }
            }
            
            
        break;
            
    
    }
}


#region Debug

view_player = noone;

//ativando o debug
ativa_debug = function()
{
    //alterando o valor de global.debug
    var _ativa_debug = keyboard_check_pressed(vk_tab);
    
    //só vai rodar se o jogo estiver no modo debug
    if (!DEBUG_MODE) return;
    
    if (_ativa_debug)
    {
        global.debug = !global.debug;
        
        if (global.debug)
        {
            roda_debug();
        }
        else
        {
            show_debug_overlay(false);
            if (dbg_view_exists(view_player))
            {
                dbg_view_delete(view_player);
            }
        }
    }
}


roda_debug = function()
{
    if !global.debug return;
        
    show_debug_overlay(global.debug);

    //criando meu próprio debug overlay
    view_player = dbg_view("Debug player", 1, 30, 100, 400, 250);
    
    //vendo as info de velv e velh
    dbg_watch(ref_create(id, "velv"), "velocidade vertical");
    dbg_watch(ref_create(id, "velh"), "velocidade horizontal");
    
    //testando e podendo mudar valores do meu velv
    dbg_slider(ref_create(id, "max_velv"), 1, 10, "max_velv", 0.1);
    
    //vendo as informações do meu g
    dbg_watch(ref_create(id, "g"), "gravidade");
    
    //testando e podendo mudar valores do meu g
    dbg_slider(ref_create(id, "g"), , 10, "Gravidade", 0.1);
    
    
}


#endregion

