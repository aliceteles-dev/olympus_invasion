sprite_atual = "chegando"

minha_sprite = function()
{
    switch(sprite_atual)
    {
        case "chegando":
            sprite_index = spr_entrada_hades;
            
            if (image_index >= 8)
            {
                sprite_atual = "normal";
            }
        
        break;
    
    
        case "normal":
            sprite_index = spr_hades;
        
            break;
    }
    
    
    
}