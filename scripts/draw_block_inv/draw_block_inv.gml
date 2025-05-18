function draw_block_inv(_x,_y,_sprite){
	_y++;
	draw_sprite_pos(sprItems,_sprite,_x+1,_y+2,_x+8,_y+4,_x+8,_y+14,_x+1,_y+12,0.75);
	draw_sprite_pos(sprItems,_sprite,_x+8,_y+4,_x+15,_y+2,_x+15,_y+12,_x+8,_y+14,0.5);
	draw_sprite_pos(sprItems,_sprite,_x+8,_y,_x+15,_y+2, _x+8,_y+4, _x+1,_y+2,1);
}