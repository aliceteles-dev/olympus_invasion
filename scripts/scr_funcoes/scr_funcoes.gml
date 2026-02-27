//controlando o modo debug

#macro DEBUG_MODE 0


#macro modo_normal:DEBUG_MODE 0
#macro modo_debug:DEBUG_MODE 1




global.transicao = false;

global.debug = false;

//definindo pra qual room eu vou
global.room_goto = rm_jogo1;

//posso sair da room?
global.leave = false;

function transicao()
{
    if (global.leave)
    { 
        global.leave = false;
        global.transicao = true;
        layer_sequence_create("transicao", room_width / 2, room_height / 2, sqn_transicao1);
    }

}

function termina_transicao()
{
    global.transicao = false;
}


function transicao2()
{
    if (global.leave and instance_exists(obj_player))
    { 
        global.leave = false;
        layer_sequence_create("transicao", obj_player.x - 180, obj_player. y - 1002, sqn_transicao1);
    }

}

function muda_room()
{

        room_goto(global.room_goto);
        global.leave = false;

}