inputs_player();

estou_na_plataforma();
tocando_chao();
movimento();
pulando();
//inicia_ataque();
animacoes();



if (keyboard_check_pressed(ord("F")) && !atacando)
{
    atacando = true;
    image_index = 0;

    if (direcao == 1)
        estado = "fight_right";
    else
        estado = "fight_left";
}


ativa_debug();

//if atacando show_message("Sou true!")
//show_debug_message(pulei)