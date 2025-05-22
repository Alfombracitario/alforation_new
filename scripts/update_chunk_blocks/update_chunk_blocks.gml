function update_chunk_blocks(){//you should execute this code inside the objChunk
	vertex_delete_buffer(t);
	t = vertex_create_buffer();
	vertex_begin(t,global.f);
	
for(var zz = 0; zz <= zlimit; zz++)
{
	for(var i = 0; i<16; i++)
	{
		for(var j = 0; j<16; j++)
		{
			
		if(blocks[i][j][zz] == 1)
			{
				var _x = x+(i << 4);
				var _y = y+(j << 4);
				draw_3d_cube(_x,_y,zz,70);
			}
		}
	}
}
	vertex_end(t);
	vertex_freeze(t);//submit the vertex to the VRAM, to edit it you need to delete the vertex buffer
}