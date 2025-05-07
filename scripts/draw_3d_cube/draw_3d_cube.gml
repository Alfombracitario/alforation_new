function draw_3d_cube(_x,_y,_z,sprite, color = c_white) {
	//top
	var tex = get_texture_coords_sprite(sprBtiles,sprite)
	
	_z = _z*-16 //convertir z a una variable normal
	var sx = _x+16;
	var sy = _y+16;
	var zv = _z-16;
	vertex_position_3d(t, _x, _y, zv);
	vertex_color(t, color, 0.5);
	vertex_texcoord(t,tex.x2,tex.y2);
	vertex_position_3d(t, sx, sy, zv);
	vertex_color(t, color, 0.5);
	vertex_texcoord(t,tex.x1,tex.y1);
	vertex_position_3d(t, _x, sy, zv);
	vertex_color(t, color, 0.5);
	vertex_texcoord(t,tex.x2,tex.y1);
	vertex_position_3d(t, _x, _y, zv);
	vertex_color(t, color, 0.5);
	vertex_texcoord(t,tex.x2,tex.y2);
	vertex_position_3d(t, sx, _y, zv);
	vertex_color(t, color, 0.5);
	vertex_texcoord(t,tex.x1,tex.y2);
	vertex_position_3d(t, sx, sy, zv);
	vertex_color(t, color, 0.5);
	vertex_texcoord(t,tex.x1,tex.y1);
	
	//up
	vertex_position_3d(t,_x,_y,_z); 
	vertex_color(t, color, 0.5);
	vertex_texcoord(t,tex.x2,tex.y2);
	vertex_position_3d(t,sx,_y,zv);
	vertex_color(t, color, 0.5);
	vertex_texcoord(t,tex.x1,tex.y1);
	vertex_position_3d(t,_x,_y,zv);
	vertex_color(t, color, 0.5);
	vertex_texcoord(t,tex.x2,tex.y1);
	vertex_position_3d(t,_x,_y,_z);
	vertex_color(t, color, 0.5);
	vertex_texcoord(t,tex.x2,tex.y2);
	vertex_position_3d(t,sx,_y,_z);
	vertex_color(t, color, 0.5);
	vertex_texcoord(t,tex.x1,tex.y2);
	vertex_position_3d(t,sx,_y,zv);
	vertex_color(t, color, 0.5);
	vertex_texcoord(t,tex.x1,tex.y1);
	
	
	vertex_position_3d(t,sx,sy,_z); //right
	vertex_color(t, color, 0.5);
	vertex_texcoord(t,tex.x1,tex.y2);
	vertex_position_3d(t,sx,sy,zv);
	vertex_color(t, color, 0.5);
	vertex_texcoord(t,tex.x1,tex.y1);
	vertex_position_3d(t,sx,_y,zv);
	vertex_color(t, color, 0.5);
	vertex_texcoord(t,tex.x2,tex.y1);
	vertex_position_3d(t,sx,sy,_z);
	vertex_color(t, color, 0.5);
	vertex_texcoord(t,tex.x1,tex.y2);
	vertex_position_3d(t,sx,_y,zv);
	vertex_color(t, color, 0.5);
	vertex_texcoord(t,tex.x2,tex.y1);
	vertex_position_3d(t,sx,_y,_z);
	vertex_color(t, color, 0.5);
	vertex_texcoord(t,tex.x2,tex.y2);
	
	vertex_position_3d(t,_x,sy,_z); //back
	vertex_color(t, color, 0.5);
	vertex_texcoord(t,tex.x1,tex.y2);
	vertex_position_3d(t,_x,sy,zv);
	vertex_color(t, color, 0.5);
	vertex_texcoord(t,tex.x1,tex.y1);
	vertex_position_3d(t,sx,sy,zv);
	vertex_color(t, color, 0.5);
	vertex_texcoord(t,tex.x2,tex.y1);
	vertex_position_3d(t,_x,sy,_z);
	vertex_color(t, color, 0.5);
	vertex_texcoord(t,tex.x1,tex.y2);
	vertex_position_3d(t,sx,sy,zv);
	vertex_color(t, color, 0.5);
	vertex_texcoord(t,tex.x2,tex.y1);
	vertex_position_3d(t,sx,sy,_z);
	vertex_color(t, color, 0.5);
	vertex_texcoord(t,tex.x2,tex.y2);
	
	
	vertex_position_3d(t,_x,sy,_z); //left
	vertex_color(t, color, 0.5);
	vertex_texcoord(t,tex.x2,tex.y2);
	vertex_position_3d(t,_x,_y,zv);
	vertex_color(t, color, 0.5);
	vertex_texcoord(t,tex.x1,tex.y1);
	vertex_position_3d(t,_x,sy,zv);
	vertex_color(t, color, 0.5);
	vertex_texcoord(t,tex.x2,tex.y1);
	vertex_position_3d(t,_x,sy,_z);
	vertex_color(t, color, 0.5);
	vertex_texcoord(t,tex.x2,tex.y2);
	vertex_position_3d(t,_x,_y,_z);
	vertex_color(t, color, 0.5);
	vertex_texcoord(t,tex.x1,tex.y2);
	vertex_position_3d(t,_x,_y,zv);
	vertex_color(t, color, 0.5);
	vertex_texcoord(t,tex.x1,tex.y1);
}