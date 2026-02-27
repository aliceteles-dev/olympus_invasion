pode_mudar_room = function()
{
    if instance_exists(obj_player)
    {
        if (obj_player.x >= room_width + 32)
        {
            global.leave = true;
        }
    }
}


global.room_goto = destino;