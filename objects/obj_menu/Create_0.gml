//criando array para os componentes do menu

menu = ["jogar", "tutorial", "idioma", "sair"]

atual = 0;

margem = 0;


//metodos
controla_menu = function()
{
	if (keyboard_check_pressed(vk_down))
	{
		atual += 1;	
		margem = 0;
	}

	if (keyboard_check_pressed(vk_up))
	{
		atual--;	
		margem = 0;
	}

	show_debug_message(atual);

	atual = clamp(atual, 0, array_length(menu) - 1);


	margem = lerp(margem, 40, .1);
	
	//fazendo o menu funcionar
	if (keyboard_check_released(vk_enter))
	{
		ativa_menu()
	}
	
	
}

ativa_menu = function()
{
	switch(atual)
	{
		//jogar
		case 0:
			room_goto(rm_jogo);

		break;
	
		//tutorial
		case 1:
			room_goto(rm_tutorial);

		break;
	
		//idioma
		case 2:
			room_goto(rm_idioma);

		break;
	
		//sair
		case 3:
			game_end();
		
		break;
	
	}
}

draw_menu = function()
{
	var _altura = display_get_gui_height() / 2.25;


	//alinhando
	draw_set_valign(fa_middle); //fa_middle = 1

	//escolhendo a fonte 
	draw_set_font(fnt_menu);

	//espaçamento entre linhas
	var _height = string_height("D");

	
	for (var i = 0; i < array_length(menu); i++)
	{
		//variáveis para destacar o texto selecionado
		var _cor = c_white
		var _margem = 0;
	
		//destacando o texto selecionado
		if (atual == i)
		{
			_cor = c_red;
			_margem = margem;
		}
	
		draw_set_color(_cor);
		draw_text(20 + _margem, _altura + i * _height, menu[i]);
		//reset
		draw_set_color(-1);

	}




	//resetando o alinhamento e a fonte
	draw_set_valign(0);
	draw_set_font(-1);
}