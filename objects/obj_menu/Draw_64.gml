draw_set_font(fnt_title)

var metade = display_get_gui_width() - display_get_gui_width() / 2 
draw_set_halign(fa_center)
draw_text(metade, 56, "Olympus Invasion");


//resetando a fonte e o alinhamento do eixo x
draw_set_font(-1);
draw_set_halign(-1);

//draw_set_font(fnt_menu);
draw_menu();
//draw_set_font(-1);