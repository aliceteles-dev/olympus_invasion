global.leave = false;
global.transicao_ativa = false;
layer_sequence_create("transicao", 160, 90, sqn_entra_fase1);

audio_stop_all();
audio_play_sound(som_bit_quest, 4, true);