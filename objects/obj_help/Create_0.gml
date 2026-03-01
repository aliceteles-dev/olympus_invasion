
tempo_da_room = game_get_speed(gamespeed_fps) * 9;
timer = 0;
posso_pular = false;


terminei_o_jogo = function()
{
	timer++;
	
	if (timer >= tempo_da_room)
	{
		//room_goto(rm_inicio);
        //vou deixar o player decidir quando está pronto pra voltar
        layer_sequence_create("sequence", 165, 90, sqn_pular_intro);
        posso_pular = true;
	}
}