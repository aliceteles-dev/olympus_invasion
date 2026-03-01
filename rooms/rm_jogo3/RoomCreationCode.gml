
global.leave = false;

global.proxima_room = rm_jogo4; 
global.transicao_ativa = false ;

layer_sequence_create("transicao", 160, 280, sqn_entra_olimpo);

audio_stop_all()

audio_play_sound(som_blip_stream, 3, true);
