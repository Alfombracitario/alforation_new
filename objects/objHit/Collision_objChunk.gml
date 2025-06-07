if(activated == true)
{
	var _tree = other.tree;
	var _th = other.th;
	var _tw = other.tw;
	var _uv = other.uv;
	var _x = (x>>4)<<4;
	var _y = (y>>4)<<4;
	var dam = damage;
	var chunkid = instance_place(_x,_y,objChunk);
	with(other)
	{
		if(objectcount > 0)
		{
			var _index = detect_tile(_x,_y);
			if(_index != -1)
			{
				objHit.activated = false;//chocó con un tile, se desactiva el golpe
                if(objImposter.activated)//olvidarnos del tile de antes, ahora estamos con uno nuevo
				{
					with(objImposter.chunk_id)
					{
						var _in = objImposter.tile_index;
						var _xps = objImposter.x-8;
						var _yps = objImposter.y-8;
						draw = true;
						array_insert(objects,objectcount,[_in,_xps,_yps]);
						objectcount++;
						event_user(2);
					}
				}
				
	            with(objPlayer) damage_hand_item(1);
				//activar al impostor por primera vez en ese tile     
				var _tile_index = objects[_index][0];
				with(objImposter)
				{
					chunk_id = chunkid; //cambio de chunk
					tile_index = _tile_index;
					damage = dam;
					x = _x+8;
					y = _y+8;
					if _tile_index == 0
					{
						tree = _tree;
						uv = _uv;
						th = _th;
						tw = _tw;
						hp = (abs(_th)+_tw)*0.125;
					}
					else
					{
						th = -16;
						tw = 8;
						//de momento (?)
						hp = 0;
						
					}
					activated = true;
					event_user(1);
				}
                
				array_delete(objects,_index,1);
				objectcount--;
			}
		}
		//actualizar solo el chunk afectado
		draw = true;
		event_user(2);
	}
}