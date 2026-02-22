//mapeamento dos botões
keyboard_set_map(ord("A"), vk_left);
keyboard_set_map(ord("D"), vk_right);


#region Variáveis 

//controle
estou_no_chao       = false;
estou_na_plat_movel = false;

//movimento
velh = 0;
max_velh = 3;
velv = 0;
max_velv = 7;
g = .2;


//variaveis de input do player
direita = false;
esquerda = false;
pular = false;
atirar = false;


#endregion


#region Métodos
inputs_player = function()
{
    direita = keyboard_check(vk_right);
    esquerda = keyboard_check(vk_left);
    pular = keyboard_check(vk_space);
}


movimento = function()
{
    //lo´gica do movimento horizontal
    velh = (direita - esquerda) * max_velh;
    
    //aplicando essa lógica e cuidando da colisão
    move_and_collide(velh, 0, global.solidos, 12);
    
    //movimento do eixo y
    move_and_collide(0, velv, global.solidos, 12);
    
    //também quero que o player colida com a plataforma móvel
    //move_and_collide(0, 0, obj_plataforma_movel, 12);
    
    if (!estou_no_chao)
    {
        velv += g;
    }
    else 
    {
        velv = 0;
        velv -= pular * max_velv;	
    }
    
    if (estou_na_plat_movel)
    {
        velv = 0;
        velv -= pular * max_velv;	
    }
}

tocando_chao = function()
{
    estou_no_chao = place_meeting(x, y + 1, obj_parede);
}

estou_na_plataforma = function()
{
    estou_na_plat_movel = place_meeting(x, y + 1, obj_plataforma_movel);
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


#endregion
