function init_3d_model_animation(frame_count)
{
v = vertex_create_buffer();

	for(var i = 0; i < frame_count+1; i++)
	{
		frame[i] = i/frame_count;
	}
frame_index = 0;
}