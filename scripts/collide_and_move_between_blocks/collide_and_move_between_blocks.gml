function collide_and_move_between_blocks(tile_array, _x, _y, _xmove, _ymove) {
    var hitbox = 7;

    var _tile_x = (_x + _xmove + sign(_xmove) * hitbox)>>4;
    var _tile_y = (_y / 16)<<0;
    if (tile_array[1+_tile_x][1+_tile_y] == 1) {
        while (tile_array[1+(_x + sign(_xmove) * 0.05 + sign(_xmove) * hitbox)>>4][1+_tile_y] != 1) {
            _y += sign(_xmove) * 0.05;
			_x += sign(_xmove) * 0.05;
        }
        _xmove = 0;
    }
	_tile_x = (_x / 16)<<0;
    _tile_y = ((_y + _ymove + sign(_ymove) * hitbox) / 16)<<0;
    if (tile_array[1+_tile_x][1+_tile_y] == 1) {
        while (tile_array[1+_tile_x][1+(_y + sign(_ymove) * 0.05 + sign(_ymove) * hitbox)>>4] != 1) {
            y += sign(_ymove) * 0.05;
			_y += sign(_ymove) * 0.05;
        }
        _ymove = 0;
    }
    
    x += _xmove;
    y += _ymove;
    
    _xmove = lengthdir_x(s_sp, ((360 - cam_yaw + 90) + 360) mod 360);
    _ymove = lengthdir_y(s_sp, ((360 - cam_yaw + 90) + 360) mod 360);
    
    _tile_x = floor((_x + _xmove + sign(_xmove) * hitbox) / 16);
    _tile_y = _y>>4;
    if (tile_array[1+_tile_x][1+_tile_y] == 1) {
        while (tile_array[1+floor((_x + sign(_xmove) * 0.02 + sign(_xmove) * hitbox) / 16)][1+_tile_y] != 1) {
            _x += sign(_xmove) * 0.02;
			x += sign(_xmove) * 0.02;
        }
        _xmove = 0;
    }
    
    _tile_x = _x>>4;
    _tile_y = floor((_y + _ymove + sign(_ymove) * hitbox) / 16);
    if (tile_array[1+_tile_x][1+_tile_y] == 1) {
        while (tile_array[1+_tile_x][1+floor((_y + sign(_ymove) * 0.02 + sign(_ymove) * hitbox) / 16)] != 1) {
            _y += sign(_ymove) * 0.02;
			y += sign(_ymove) * 0.02;
        }
        _ymove = 0;
    }
    
    x += _xmove;
    y += _ymove;
}
