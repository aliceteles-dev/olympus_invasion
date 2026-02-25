//quero que ele execute uma ação quando a animação de ataque acabar
if (sprite_index == spr_medusa_attack)
{
    //show_message("Terminei meu ataque!")
    sprite_index = spr_medusa_idle;
    hspeed = velh * direcao;

}