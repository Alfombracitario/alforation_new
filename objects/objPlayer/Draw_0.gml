//inicio del dibujo
//primero las cosas sin zbuffer
with(objSun)
{
	event_perform(ev_draw,0);
}

//ahora el terreno
if(room == game)
{
	if(global.clouds)
	{
	//nubes
	cloudtime += global.fpsmode;
	cloudtime = cloudtime & 8191;
	shader_set(sClouds);
	shader_set_uniform_f(_cplayerpos,x,y);
	shader_set_uniform_f(_cltime,cloudtime*0.125);
	var cfc = fog_color
	var r = color_get_red(cfc)/255;
	var g = color_get_green(cfc)/255;
	var b = color_get_blue(cfc)/255;
	shader_set_uniform_f(_cfogcol,r,g,b);
	var cfc = timecolor
	var r = color_get_red(cfc)/255;
	var g = color_get_green(cfc)/255;
	var b = color_get_blue(cfc)/255;
	shader_set_uniform_f(_timecol,r,g,b);
	shader_set_uniform_f(_cfogset,fog_depth-fog_density,fog_depth);
	vertex_submit(vbC,pr_trianglelist,3);
	}
	if(global.hd)
	{
	if(global.shadows)//a la mierda el rendimiento
		{
			gpu_set_ztestenable(true);//actvar el zbuffer
			var smat = matrix_build_lookat(x, objSun.sy, objSun.sz, x, y, z, 0, 0, 1);
			camera_set_view_mat(view_camera[0], smat);
			shader_set(sBillboard_shadows);
			gpu_set_cullmode(cull_noculling);
			
			surface_set_target(shadows_surface);
			with(objChunk)
			{
				event_perform(ev_draw,0);
			}
			//preparar para el dibujo normal
			gpu_set_cullmode(cull_counterclockwise);
			surface_reset_target();
			camera_set_view_mat(view_camera[0], mat);
		}
	
	//el resto 
	movetime+=1+abs(sin(movetime));
	shader_set(sBillboard);
	shader_set_uniform_f(_t,global.sincyphp,global.coscyphp);
	shader_set_uniform_f(fog_settings,fog_depth-fog_density,fog_depth);
	shader_set_uniform_f(_move,dsin(movetime)+0.5);
	var r = color_get_red(fog_color)/255;
	var g = color_get_green(fog_color)/255;
	var b = color_get_blue(fog_color)/255;
	shader_set_uniform_f(fogcol,r,g,b);
	}
	else//gráficos básicos
	{
		shader_set(sBillboard_fast);
		shader_set_uniform_f(_t,global.sincyphp,global.coscyphp);
		shader_set_uniform_f(fog_settings,fog_depth-fog_density,fog_depth);
		var r = color_get_red(fog_color)/255;
		var g = color_get_green(fog_color)/255;
		var b = color_get_blue(fog_color)/255;
		shader_set_uniform_f(fogcol,r,g,b);	
	}
	gpu_set_ztestenable(true);//actvar el zbuffer
	with(objChunk)
	{
		event_perform(ev_draw,0);
	}
	
	shader_reset();
}
//ahora se dibuja el resto por si solo