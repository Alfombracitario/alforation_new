function place_block(){
	var _cx = pcx;
	var _cy = pcy;
	var _x = rcx>>0;
	var _y = rcy>>0;
	var _z = -z>>4;
	var ins = instance_place(x,y,objChunk);//I HAVE to improve this
	with(ins)//adds a block to the chunk
	{
		if!(_cx == cx && _cy == cy) exit;
		if(zlimit < _z)
		{
			show_debug_message("Block chunk updated")
			
			if(zlimit == -1)
			{
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
			
		}//Ends of the update
		
		//add the block to the array
		blocks[_x][_y][_z] = 1;
			
		//Re build the 3D model of the blocks
		update_chunk_blocks();
		
	}
}