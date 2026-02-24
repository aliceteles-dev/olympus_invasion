//quero que ele execute uma ação quando a animação de ataque acabar
if (sprite_index == spr_rato_ataque)
{
    //show_message("Terminei meu ataque!")
    sprite_index = spr_rato_walking;
    hspeed = velh * direcao;

}