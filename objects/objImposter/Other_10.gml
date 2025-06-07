//cuando se destruye
var _th = th;
var _tw = tw;
var _tile = tile_index;
with(objPlayer)
{
	var _item = drops[_tile][0];
	var _count = drops[_tile][1];
	if _tile == T_TREE _count = ((_th*-1)+_tw)>>4;

	if(_count < 1)
	{
		var probabilidad = _count;
		_count = (random(1) < probabilidad) ? 1 : 0;
	}
	add_item(_item,_count);
    add_xp(drops[_tile][2]);
}
activated = false;
if(tile_index == T_TREE)
{
	audio_play_sound_at(sndTreedestroy,x,y,0,0,64,1,0,0);
}