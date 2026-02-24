movimento();
deixa_pra_atacar();

if (vida <= 0)
{
    instance_destroy();
}

if (alarme <= 35 && sprite_index == spr_rato_walking)
{
  atacando();
}


//show_debug_message(hspeed);