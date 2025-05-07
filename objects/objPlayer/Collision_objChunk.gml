ExtTemperature = other.temperature;
humidity = other.humidity;
other.save = true;
if(mouse_check_button(mb_right))
{
	var _cx = pcx;
	var _cy = pcy;
	var _x = rcx>>0;
	var _y = rcy>>0;
	var _z = -z>>4;
	with(other)//añadir un bloque al chunk
	{
		if!(_cx == cx && _cy == cy) exit;
		if(zlimit < _z)
		{
			show_debug_message("Block chunk updated")
			
			if(zlimit == -1)
			{//se inicia para poder soportar bloques
				show_debug_message("Block chunk created")
				t = vertex_create_buffer();
				vertex_begin(t,global.f);
				vertex_end(t);
				zlimit = 0;
			}
			
			for(var zz = zlimit; zz <= _z; zz++)
			{
				for(var i = 0; i<16; i++)
				{
					for(var j = 0; j<16; j++)
					{
						blocks[i][j][zz] = 0;
					}
				}
			}
			zlimit = _z;
			
		}//fin de la actualización
		
		//poner los bloques
		blocks[_x][_y][_z] = 1;
			
		//se rearma la malla 3D
		update_chunk_blocks();
		
	}
}