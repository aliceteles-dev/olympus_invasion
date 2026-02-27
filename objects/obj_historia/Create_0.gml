//algoritmo: variável pra marcar o tempo total da room
//timers pra escrever o texto e apagá-lo da room
//variavel de sair da room - ela fica positiva quando o tempo total da room acaba
//ou quando o player aperta a tecla de pular (esc)

//talvez um método pra aplicar no draw, que vai ser responsável por todo o texto

//leave = false;

//array com todos os textos: 
texto = ["Ainda não caiu a ficha...", "Ainda não caiu a ficha... que meu melhor amigo...", "...se foi.", "Eu vou sentir muito a sua falta, Pingo.", "Se ao menos eu pudesse te ver uma última vez pra me despedir...", "Não acredito que eu estava no trabalho quando você partiu!", "Então você quer reencontrar seu amigo?", "O quê?? Quem é você?", "O mundo dos mortos e o mundo dos vivos não se misturam,", "mas se você se provar capaz de alcançar o mundo dos deuses, eu abrirei uma exceção.", "Vá até o Monte Olimpo!", "É lá onde a alma do seu cachorro te aguarda."];                                        
indice_texto = 0;
aumentar_indice = false;

tempo_texto = game_get_speed(gamespeed_fps) * 2;
timer_escrever = 0;
timer_apagar = 0;

//locais pra desenhar o texto
xx = display_get_gui_width() / 2;
yy = display_get_gui_height() - 80;

inicia_historia = function()
{
    timer_escrever++
    timer_apagar++;
}


indice_texto = clamp(indice_texto, 0, 12);

//contexto = function()
//{
    //draw_set_font(fnt_contexto);
    //
    //if (timer_escrever >= tempo_texto)
    //{
        ////draw_text(room_width / 2, 200, "texto")
        //
        ////show_message("pÔ!")
        //
        //draw_text(100, 100, string(texto[indice_texto]))
        //
        //aumentar_indice = true;
        ////timer_escrever = 0;
    //}
//}
//
//
//proximo_texto = function()
//{
    //if (timer_apagar>= tempo_texto * 3 and aumentar_indice)
    //{
        //tempo_texto = 0;
        //indice_texto += 1;
        //aumentar_indice = false;
    //}
    //
    //
//}


//vou meter o texto numa máquina de estado e gg
estado = 0;

escrevendo_texto = function()
{

    
    switch(estado)
    {
        case 0:
            
            if (timer_escrever >= tempo_texto * 3)
            {
                timer_escrever = 0;
                estado = 1;
                indice_texto += 1;
            }
            else if (timer_escrever >= tempo_texto)
            {
                draw_text_ext(xx, yy, string(texto[indice_texto]), 20, 600);
            }
            
            
        break;
           
        case 1:
            timer_escrever++;
            
            if (timer_escrever >= tempo_texto * 3)
            {
                timer_escrever = 0;
                estado = 2;
                indice_texto += 1;
            }
            else if (timer_escrever >= tempo_texto)
            {
                draw_text_ext(xx, yy, string(texto[indice_texto]), 20, 600);
            }
        break;
        
        
        case 2:
            timer_escrever++;
            
            if (timer_escrever >= tempo_texto * 3)
            {
                timer_escrever = 0;
                estado = 3;
                indice_texto += 1;
            }
            else if (timer_escrever >= tempo_texto)
            {
                draw_text_ext(xx, yy, string(texto[indice_texto]), 20, 600);
            }
        break;
        
        case 3:
            timer_escrever++;
            
            if (timer_escrever >= tempo_texto * 3)
            {
                timer_escrever = 0;
                estado = 4;
                indice_texto += 1;
            }
            else if (timer_escrever >= tempo_texto)
            {
                draw_text_ext(xx, yy, string(texto[indice_texto]), 20, 600);
            }
        break;
        
        case 4:
            timer_escrever++;
            
            if (timer_escrever >= tempo_texto * 3)
            {
                timer_escrever = 0;
                estado = 5;
                indice_texto += 1;
            }
            else if (timer_escrever >= tempo_texto)
            {
                draw_text_ext(xx, yy, string(texto[indice_texto]), 20, 600);
            }
        break;
        
        case 5:
            timer_escrever++;
            
            if (timer_escrever >= tempo_texto * 8)
            {
                timer_escrever = 0;
                estado = 6;
                indice_texto += 1;
            }
            else if (timer_escrever >= tempo_texto)
            {
                draw_text_ext(xx, yy, string(texto[indice_texto]), 20, 600);
            }
        break;
        
        case 6:
            timer_escrever++;
            
            if (timer_escrever >= tempo_texto * 3)
            {
                timer_escrever = 0;
                estado = 7;
                indice_texto += 1;
            }
            else if (timer_escrever >= tempo_texto)
            {
                draw_text_ext(xx, yy, string(texto[indice_texto]), 20, 600);
            }
        break;
        
        case 7:
            timer_escrever++;
            
            if (timer_escrever >= tempo_texto * 3)
            {
                timer_escrever = 0;
                estado = 8;
                indice_texto += 1
            }
            else if (timer_escrever >= tempo_texto)
            {
                draw_text_ext(xx, yy, string(texto[indice_texto]), 20, 600);
            }
        break;
        
        case 8:
            timer_escrever++;
            
            if (timer_escrever >= tempo_texto * 3)
            {
                timer_escrever = 0;
                estado = 9;
                indice_texto += 1;
            }
            else if (timer_escrever >= tempo_texto)
            {
                draw_text_ext(xx, yy, string(texto[indice_texto]), 20, 600);
            }
        break;
        
        case 9:
            timer_escrever++;
            
            if (timer_escrever >= tempo_texto * 4)
            {
                timer_escrever = 0;
                estado = 10;
                indice_texto += 1;
            }
            else if (timer_escrever >= tempo_texto)
            {
                draw_text_ext(xx, yy, string(texto[indice_texto]), 20, 600);
            }
        break;
        
        case 10:
            timer_escrever++;
            
            if (timer_escrever >= tempo_texto * 3)
            {
                timer_escrever = 0;
                estado = 11;
                indice_texto += 1;
            }
            else if (timer_escrever >= tempo_texto)
            {
                draw_text_ext(xx, yy, string(texto[indice_texto]), 20, 600);
            }
        break;
        
        case 11:
            timer_escrever++;
            
            if (timer_escrever >= tempo_texto * 3)
            {
                timer_escrever = 0;
                estado = 12;
                indice_texto += 1;
            }
            else if (timer_escrever >= tempo_texto)
            {
                draw_text_ext(xx, yy, string(texto[indice_texto]), 20, 600);
            }
        break;
        
        case 12:
           layer_sequence_create("transicao", room_width / 2, room_height / 2, sqn_transicao1);
          
        break;
        
        
        
        
        
        
    }
    
}








//deixando o player pular a introdução:
input_pular = function()
{
    leave = keyboard_check_pressed(vk_escape);
}

pode_pular = function()
{
    if (leave)
    {
        global.leave = true;
    }
}


global.room_goto = rm_jogo1;