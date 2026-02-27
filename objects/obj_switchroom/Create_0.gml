

pode_mudar_room = function()
{
    if instance_exists(obj_player)
    {
        if (obj_player.x >= room_width + 16)
        {
            global.leave = true;
            global.room_goto = destino;
        }
    }
}

show_debug_message("Destino dessa instância: " + room_get_name(destino));
