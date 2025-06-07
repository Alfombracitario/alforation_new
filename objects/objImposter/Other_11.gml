//cuando le pegan :(
hp -= damage;
if(hp <= 0)
{
	event_user(0)
}
else
{
	//hardcodeado porque soy weón
	if(tile_index == T_TREE)
	{
		audio_play_sound_at(sndTreehit,x,y,0,0,64,1,0,0);
	}
	else if(tile_index == T_STONE)
	{
		audio_play_sound_at(sndStonehit,x,y,0,0,64,1,0,0);
	}
	
}
rotation = 15;