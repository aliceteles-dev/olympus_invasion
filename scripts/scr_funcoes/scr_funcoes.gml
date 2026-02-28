//controlando o modo debug

#macro DEBUG_MODE 0


#macro modo_normal:DEBUG_MODE 0
#macro modo_debug:DEBUG_MODE 1





global.debug = false;

//definindo pra qual room eu vou
global.room_goto = noone;

//posso sair da room?
global.leave = false;


//lidando com o bug da room 
global.transicao = false;
global.proxima_room = noone;

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
        layer_sequence_create("transicao", obj_player.x - 180, obj_player. y - 100, sqn_transicao1);
    }

}

function muda_room()
{

        room_goto(global.proxima_room);
        global.leave = false;

}