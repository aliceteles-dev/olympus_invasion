//n]ao quero que o plaer saia pela esquerda da room
x = clamp(x, 0, room_width + 200);

inputs_player();

estou_na_plataforma();
tocando_chao();
movimento();
pulando();
//inicia_ataque();

animacoes();

if (place_meeting(x, y + 1, solidos))
{
    checkpoint_x = x;
    checkpoint_y = y;
}

if (!place_meeting(x, y + 1, solidos) && velv > 0 && y >= room_height + 32)
{
    cair_no_buraco();
}


//posso_mudar_level();
//muda_room();

//show_debug_message(global.leave)

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


//reiniciar
if (keyboard_check_pressed(ord("R")))
{
    global.transicao_ativa = true;
    room_restart()
    global.proxima_room = obj_switchroom.destino;
        
    layer_sequence_create("transicao", x, y, sqn_transicao1);
}