if(activated)
{
	if(tile_index == 0)
	{
		
		var s = global.sincyphp;
		var c = global.coscyphp;
		
		var ms = c*sin(rotation)*rotation;
		var mc = s*sin(rotation)*rotation;
		
		var bill1 = s*tw;
		var bill2 = c*tw;
	
		vertex_begin(v[0],f[0]);
	
		var lefty  = y + bill1;
		var righty = y - bill1;
		var leftx  = x + bill2;
		var rightx = x - bill2;
	
		var tcx1 = uv[0];
		var tcx2 = uv[2];
		var tcy1 = uv[1];
		var tcy2 = uv[3];
	
		vertex_position_3d(v[0],leftx+mc,lefty+ms,th);
		vertex_color(v[0],c_white,1);
		vertex_texcoord(v[0],tcx2,tcy1);
		vertex_position_3d(v[0],leftx,lefty,0);
		vertex_color(v[0],c_white,1);
		vertex_texcoord(v[0],tcx2,tcy2);
		vertex_position_3d(v[0],rightx+mc,righty+ms,th);
		vertex_color(v[0],c_white,1);
		vertex_texcoord(v[0],tcx1,tcy1);
		vertex_position_3d(v[0],leftx,lefty,0);
		vertex_color(v[0],c_white,1);
		vertex_texcoord(v[0],tcx2,tcy2);
		vertex_position_3d(v[0],rightx,righty,0);
		vertex_color(v[0],c_white,1);
		vertex_texcoord(v[0],tcx1,tcy2);
		vertex_position_3d(v[0],rightx+mc,righty+ms,th);
		vertex_color(v[0],c_white,1);
		vertex_texcoord(v[0],tcx1,tcy1);
	
		vertex_end(v[0]);
	}
	
	vertex_begin(v[1],f[1]);//este es el modelo de las particulas

	var parcount = array_length(particles);
	for(var i = 0; i < parcount; i++)
	{
		var _x = particles[i][0];
		var _y = particles[i][1];
		var zdo = particles[i][2];
		
		var _color
		var zup = zdo+4;
	
		vertex_position_3d(v[1],leftx,lefty,zup);
		vertex_color(v[1],_color,1);
		vertex_position_3d(v[1],leftx,lefty,zdo);
		vertex_color(v[1],_color,1);
		vertex_position_3d(v[1],rightx,righty,zup);
		vertex_color(v[1],_color,1);
		vertex_position_3d(v[1],leftx,lefty,zdo);
		vertex_color(v[1],_color,1);
		vertex_position_3d(v[1],rightx,righty,zdo);
		vertex_color(v[1],_color,1);
		vertex_position_3d(v[1],rightx,righty,zup);
		vertex_color(v[1],_color,1);
	
		vertex_end(v[1]);
	}
	//de momento
	rotation*=0.95;
}