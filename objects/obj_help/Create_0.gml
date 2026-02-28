
tempo_da_room = game_get_speed(gamespeed_fps) * 9;
timer = 0;


terminei_o_jogo = function()
{
	timer++;
	
	if (timer >= tempo_da_room)
	{
		room_goto(rm_inicio);
	}
}