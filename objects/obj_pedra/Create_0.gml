//talvez eu deva checar manualmente a colisão com o player
//porque não é justo a distância absurda da qual a pedra consegue acertar ele
//perco vida pra pedra mesmo se tiver desviado dela

acertei = function()
{
    if(instance_exists(obj_player))
    {
        if (place_meeting(x, y, obj_player))
        {
            obj_player.perde_vida();
            instance_destroy(self);
        }
    }
}