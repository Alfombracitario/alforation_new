function gen_clouds(){
	vbC = vertex_create_buffer();
	vertex_begin(vbC,global.f);

	var fuvs = get_texture_coords_sprite(sprClouds,0);
	var _size = CHUNK_SIZE<<4;
	var _cz = -512;
	
	var _x = 0;
	var _y = 0;
	
	for(i = -1; i<1; i++)
	{
		for(j = -1; j<1; j++)
		{
			_cz = -512;
			repeat(16)
			{
				_x = i*_size;
				_y = j*_size;
				_cz--;
				vertex_position_3d(vbC, _x + _size, _y + _size, _cz);
				vertex_color(vbC, c_white, 1);
				vertex_texcoord(vbC, fuvs.x1, fuvs.y1);
				vertex_position_3d(vbC, _x, _y, _cz);
				vertex_color(vbC, c_white, 1);
				vertex_texcoord(vbC, fuvs.x2, fuvs.y2);
				vertex_position_3d(vbC, _x, _y + _size, _cz);
				vertex_color(vbC, c_white, 1);
				vertex_texcoord(vbC, fuvs.x2, fuvs.y1);

				vertex_position_3d(vbC, _x + _size, _y, _cz);
				vertex_color(vbC, c_white, 1);
				vertex_texcoord(vbC, fuvs.x1, fuvs.y2);
				vertex_position_3d(vbC, _x, _y, _cz);
				vertex_color(vbC, c_white, 1);
				vertex_texcoord(vbC, fuvs.x2, fuvs.y2);
				vertex_position_3d(vbC, _x + _size, _y + _size, _cz);
				vertex_color(vbC, c_white, 1);
				vertex_texcoord(vbC, fuvs.x1, fuvs.y1);
			}
		}
	}
	vertex_end(vbC);
	vertex_freeze(vbC)
}