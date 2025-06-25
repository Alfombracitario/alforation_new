function gen_rain(){
	vbR = vertex_create_buffer();
	vertex_begin(vbR,global.f);

	var tex = get_texture_coords_sprite(sprRain,0);
	//top
	
	var _z = 0;
	var zv = -512;
	var color = $ffffff;
	var a = 0.5;
	
	
	var _size = 16;
	var _x = -_size;
	var _y = -_size;
	var sx = _size;
	var sy = _size;
	
	vertex_position_3d(vbR,sx,_y,zv);
	vertex_color(vbR, color, a);
	vertex_texcoord(vbR,tex.x1,tex.y1);
	vertex_position_3d(vbR,_x,_y,_z); 
	vertex_color(vbR, color, a);
	vertex_texcoord(vbR,tex.x2,tex.y2);
	vertex_position_3d(vbR,_x,_y,zv);
	vertex_color(vbR, color, a);
	vertex_texcoord(vbR,tex.x2,tex.y1);
	vertex_position_3d(vbR,sx,_y,_z);
	vertex_color(vbR, color, a);
	vertex_texcoord(vbR,tex.x1,tex.y2);
	vertex_position_3d(vbR,_x,_y,_z);
	vertex_color(vbR, color, a);
	vertex_texcoord(vbR,tex.x2,tex.y2);
	vertex_position_3d(vbR,sx,_y,zv);
	vertex_color(vbR, color, a);
	vertex_texcoord(vbR,tex.x1,tex.y1);
	

	vertex_position_3d(vbR,sx,sy,zv);
	vertex_color(vbR, color, a);
	vertex_texcoord(vbR,tex.x1,tex.y1);
	vertex_position_3d(vbR,sx,sy,_z); //right
	vertex_color(vbR, color, a);
	vertex_texcoord(vbR,tex.x1,tex.y2);
	vertex_position_3d(vbR,sx,_y,zv);
	vertex_color(vbR, color, a);
	vertex_texcoord(vbR,tex.x2,tex.y1);
	vertex_position_3d(vbR,sx,_y,zv);
	vertex_color(vbR, color, a);
	vertex_texcoord(vbR,tex.x2,tex.y1);
	vertex_position_3d(vbR,sx,sy,_z);
	vertex_color(vbR, color, a);
	vertex_texcoord(vbR,tex.x1,tex.y2);
	vertex_position_3d(vbR,sx,_y,_z);
	vertex_color(vbR, color, a);
	vertex_texcoord(vbR,tex.x2,tex.y2);
	

	vertex_position_3d(vbR,_x,sy,zv);
	vertex_color(vbR, color, a);
	vertex_texcoord(vbR,tex.x1,tex.y1);
	vertex_position_3d(vbR,_x,sy,_z); //back
	vertex_color(vbR, color, a);
	vertex_texcoord(vbR,tex.x1,tex.y2);
	vertex_position_3d(vbR,sx,sy,zv);
	vertex_color(vbR, color, a);
	vertex_texcoord(vbR,tex.x2,tex.y1);
	vertex_position_3d(vbR,sx,sy,zv);
	vertex_color(vbR, color, a);
	vertex_texcoord(vbR,tex.x2,tex.y1);
	vertex_position_3d(vbR,_x,sy,_z);
	vertex_color(vbR, color, a);
	vertex_texcoord(vbR,tex.x1,tex.y2);
	vertex_position_3d(vbR,sx,sy,_z);
	vertex_color(vbR, color, a);
	vertex_texcoord(vbR,tex.x2,tex.y2);
	

	vertex_position_3d(vbR,_x,_y,zv);
	vertex_color(vbR, color, a);
	vertex_texcoord(vbR,tex.x1,tex.y1);
	vertex_position_3d(vbR,_x,sy,_z); //left
	vertex_color(vbR, color, a);
	vertex_texcoord(vbR,tex.x2,tex.y2);
	vertex_position_3d(vbR,_x,sy,zv);
	vertex_color(vbR, color, a);
	vertex_texcoord(vbR,tex.x2,tex.y1);
	vertex_position_3d(vbR,_x,_y,_z);
	vertex_color(vbR, color, a);
	vertex_texcoord(vbR,tex.x1,tex.y2);
	vertex_position_3d(vbR,_x,sy,_z);
	vertex_color(vbR, color, a);
	vertex_texcoord(vbR,tex.x2,tex.y2);
	vertex_position_3d(vbR,_x,_y,zv);
	vertex_color(vbR, color, a);
	vertex_texcoord(vbR,tex.x1,tex.y1);
vertex_end(vbR);
vertex_freeze(vbR);
}