//algoritmo: variável pra marcar o tempo total da room
//timers pra escrever o texto e apagá-lo da room
//variavel de sair da room - ela fica positiva quando o tempo total da room acaba
//ou quando o player aperta a tecla de pular (esc)

//talvez um método pra aplicar no draw, que vai ser responsável por todo o texto

leave = false;

tempo_texto = 0;
timer_escrever = 0;
timer_apagar = 0;


//deixando o player pular a introdução:
input_pular = function()
{
    leave = keyboard_check(vk_escape);
}

pula_intro = function()
{
    if (leave)
    {
        room_goto(rm_jogo1);
    }
}
