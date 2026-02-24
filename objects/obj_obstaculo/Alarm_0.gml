var _x_range, _pedra, _random;
_x_range = (random_range(x_min, x_max));
_pedra = instance_create_layer(_x_range, 0 - sprite_width, "mobs", obj_pedra);
_pedra.vspeed = 3;
_random = random_range(0.5, 1);
alarm[0] = tempo * _random;