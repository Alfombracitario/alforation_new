/// @function check_collision(tile_array, x, y, hspd, vspd)
/// @param tile_array A 9-element array of nearby blocks (0 or 1)
/// @param x Horizontal position inside current tile (0 to 1)
/// @param y Vertical position inside current tile (0 to 1)
/// @param hspd Horizontal speed (delta x)
/// @param vspd Vertical speed (delta y)
function collide_and_move_between_blocks(tile_array, _x, _y, hspd, vspd){
    var next_x = _x + hspd;
    var next_y = _y + vspd;
	show_debug_message(next_x,next_y);
    // Center tile index mapping:
    // [0] upleft   [1] up    [2] upright
    // [3] left     [4] self  [5] right
    // [6] downleft [7] down  [8] downright
	
    // Check horizontal movement
    if (next_x < -1) {
        // Moving left into left or diagonal
        if (next_y < -1 && tile_array[0]) hspd = 0;
        else if (next_y > 1 && tile_array[6]) hspd = 0;
        else if (tile_array[3]) hspd = 0;
    }
    else if (next_x > 1) {
        // Moving right into right or diagonal
        if (next_y < -1 && tile_array[2]) hspd = 0;
        else if (next_y > 1 && tile_array[8]) hspd = 0;
        else if (tile_array[5]) hspd = 0;
    }
	x += hspd;
	
    // Check vertical movement
    if (next_y < 1) {
        if (next_x < -1 && tile_array[0]) vspd = 0;
        else if (next_x > 1 && tile_array[2]) vspd = 0;
        else if (tile_array[1]) vspd = 0;
    }
    else if (next_y > 1) {
        if (next_x < -1 && tile_array[6]) vspd = 0;
        else if (next_x > 1 && tile_array[8]) vspd = 0;
        else if (tile_array[7]) vspd = 0;
    }
	y += vspd;
}