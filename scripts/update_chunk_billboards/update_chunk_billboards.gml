function update_chunk_billboards(){

//remember I used vertex_freeze
vertex_delete_buffer(v);

v = vertex_create_buffer();


var zsize = [th,-16];
var color = [c_white,image_blend];
var tc = objPlayer.tc;
var tuc = objPlayer.tuc;
tc[T_TREE].x1 = uv[0];
tc[T_TREE].x2 = uv[2];
tc[T_TREE].y1 = uv[1];
tc[T_TREE].y2 = uv[3];
vertex_begin(v,global.f);
#region suelo
//adding the floor
var fuvs = get_texture_coords_sprite(sprite_index,image_index);

// size of the sprite
var half = CHUNK_SIZE * 0.5; // 128 si CHUNK_SIZE = 256

// Imagen 0 (arriba izquierda)
vertex_position_3d(v, x, y, 0);
vertex_color(v, image_blend, 0.5);
vertex_texcoord(v, fuvs.x2, fuvs.y2);

vertex_position_3d(v, x + half, y + half, 0);
vertex_color(v, image_blend, 0.5);
vertex_texcoord(v, fuvs.x1, fuvs.y1);

vertex_position_3d(v, x, y + half, 0);
vertex_color(v, image_blend, 0.5);
vertex_texcoord(v, fuvs.x2, fuvs.y1);


vertex_position_3d(v, x, y, 0);
vertex_color(v, image_blend, 0.5);
vertex_texcoord(v, fuvs.x2, fuvs.y2);

vertex_position_3d(v, x + half, y, 0);
vertex_color(v, image_blend, 0.5);
vertex_texcoord(v, fuvs.x1, fuvs.y2);

vertex_position_3d(v, x + half, y + half, 0);
vertex_color(v, image_blend, 0.5);
vertex_texcoord(v, fuvs.x1, fuvs.y1);

// Imagen 1 (arriba derecha)

vertex_position_3d(v, x + half, y, 0);
vertex_color(v, image_blend, 0.5);
vertex_texcoord(v, fuvs.x2, fuvs.y2);

vertex_position_3d(v, x + CHUNK_SIZE, y + half, 0);
vertex_color(v, image_blend, 0.5);
vertex_texcoord(v, fuvs.x1, fuvs.y1);

vertex_position_3d(v, x + half, y + half, 0);
vertex_color(v, image_blend, 0.5);
vertex_texcoord(v, fuvs.x2, fuvs.y1);


vertex_position_3d(v, x + half, y, 0);
vertex_color(v, image_blend, 0.5);
vertex_texcoord(v, fuvs.x2, fuvs.y2);

vertex_position_3d(v, x + CHUNK_SIZE, y, 0);
vertex_color(v, image_blend, 0.5);
vertex_texcoord(v, fuvs.x1, fuvs.y2);

vertex_position_3d(v, x + CHUNK_SIZE, y + half, 0);
vertex_color(v, image_blend, 0.5);
vertex_texcoord(v, fuvs.x1, fuvs.y1);

// Imagen 2 (abajo izquierda)

vertex_position_3d(v, x, y + half, 0);
vertex_color(v, image_blend, 0.5);
vertex_texcoord(v, fuvs.x2, fuvs.y2);

vertex_position_3d(v, x + half, y + CHUNK_SIZE, 0);
vertex_color(v, image_blend, 0.5);
vertex_texcoord(v, fuvs.x1, fuvs.y1);

vertex_position_3d(v, x, y + CHUNK_SIZE, 0);
vertex_color(v, image_blend, 0.5);
vertex_texcoord(v, fuvs.x2, fuvs.y1);




vertex_position_3d(v, x, y + half, 0);
vertex_color(v, image_blend, 0.5);
vertex_texcoord(v, fuvs.x2, fuvs.y2);

vertex_position_3d(v, x + half, y + half, 0);
vertex_color(v, image_blend, 0.5);
vertex_texcoord(v, fuvs.x1, fuvs.y2);

vertex_position_3d(v, x + half, y + CHUNK_SIZE, 0);
vertex_color(v, image_blend, 0.5);
vertex_texcoord(v, fuvs.x1, fuvs.y1);

// Imagen 3 (abajo derecha)

vertex_position_3d(v, x + half, y + half, 0);
vertex_color(v, image_blend, 0.5);
vertex_texcoord(v, fuvs.x2, fuvs.y2);

vertex_position_3d(v, x + CHUNK_SIZE, y + CHUNK_SIZE, 0);
vertex_color(v, image_blend, 0.5);
vertex_texcoord(v, fuvs.x1, fuvs.y1);

vertex_position_3d(v, x + half, y + CHUNK_SIZE, 0);
vertex_color(v, image_blend, 0.5);
vertex_texcoord(v, fuvs.x2, fuvs.y1);



vertex_position_3d(v, x + half, y + half, 0);
vertex_color(v, image_blend, 0.5);
vertex_texcoord(v, fuvs.x2, fuvs.y2);

vertex_position_3d(v, x + CHUNK_SIZE, y + half, 0);
vertex_color(v, image_blend, 0.5);
vertex_texcoord(v, fuvs.x1, fuvs.y2);

vertex_position_3d(v, x + CHUNK_SIZE, y + CHUNK_SIZE, 0);
vertex_color(v, image_blend, 0.5);
vertex_texcoord(v, fuvs.x1, fuvs.y1);
#endregion

for(var i = 0; i < objectcount; i++)
{
    
		var j = objects[i][0];
		if(global.hd = false)
		{
			if(j == T_TALLGRASS || j == T_FERN || j == T_GRASS)
			{
				continue;
			}
		}
		if j == -1 continue; //si es -1 entonces saltar
		c = color[tuc[j]];
		var h = j;
		
        //I don't think this is a good practice
        zsize[1] = -16;
        if j == T_TALLGRASS zsize[1] = -32;
	    if j == T_BAMBOO zsize[1] = -52;
            
        if !j == 0 j = 1;//if isn't a tree, it uses model 0
        
		
        var _a = 8/255//this is for the billboard shader
        if j == 0 _a = tw/255//tree
    
		var _x = objects[i][1];
		var _y = objects[i][2];
	
		var lefty  = _y + 8;
		var righty = _y + 8;
		var leftx  = _x + 8;
		var rightx = _x + 8;


		vertex_position_3d(v,leftx,lefty,0);
		vertex_color(v,c,0.5-_a);
		vertex_texcoord(v,tc[h].x2,tc[h].y2);
		
		vertex_position_3d(v,rightx,righty,zsize[j]);
		vertex_color(v,c,0.5+_a);
		vertex_texcoord(v,tc[h].x1,tc[h].y1);
		
		vertex_position_3d(v,leftx,lefty,zsize[j]);
		vertex_color(v,c,0.5-_a);
		vertex_texcoord(v,tc[h].x2,tc[h].y1);
    
		
		vertex_position_3d(v,leftx,lefty,0);
		vertex_color(v,c,0.5-_a);
		vertex_texcoord(v,tc[h].x2,tc[h].y2);
    
		vertex_position_3d(v,rightx,righty,0);
		vertex_color(v,c,0.5+_a);
		vertex_texcoord(v,tc[h].x1,tc[h].y2);
    
		vertex_position_3d(v,rightx,righty,zsize[j]);//arriba izquierda
		vertex_color(v,c,0.5+_a);
		vertex_texcoord(v,tc[h].x1,tc[h].y1);
}
vertex_end(v);
vertex_freeze(v);
}