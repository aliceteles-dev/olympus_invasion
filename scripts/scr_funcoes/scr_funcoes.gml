//controlando o modo debug

#macro DEBUG_MODE 0


#macro modo_normal:DEBUG_MODE 0
#macro modo_debug:DEBUG_MODE 1






global.debug = false;

//definindo pra qual room eu vou
global.room_goto = rm_jogo1;

//posso sair da room?
global.leave = false;


function muda_room()
{
    if (global.leave)
    {
        room_goto(global.room_goto);
       // global.leave = false;
    }
}