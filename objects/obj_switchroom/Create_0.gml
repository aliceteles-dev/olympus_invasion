global.room_goto = destino;

pode_mudar_room = function()
{
    if instance_exists(obj_player)
    {
        if (obj_player.x >= room_width + 16)
        {
            global.leave = true;
        }
    }
}


