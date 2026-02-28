//pode_mudar_room();
//transicao2();
//show_debug_message("Chamando transicao na room: " + room_get_name(room));
//muda_room();
//transicao();

if (!global.transicao_ativa)
{
    if (instance_exists(obj_player))
    {
        if (obj_player.x >= room_width + 16)
        {
            global.transicao_ativa = true;
            global.proxima_room = destino;

            layer_sequence_create("transicao", obj_player.x - 180, obj_player. y - 100, sqn_transicao1);
        }
    }
}
//show_debug_message("Switch ativo ID: " + string(id) + " destino: " + string(destino));