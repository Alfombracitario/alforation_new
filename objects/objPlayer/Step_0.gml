var _move = 0;
var _smove = 0;
var prevhotbarsel = hotbarsel;
#region input
if(invopen == true)
{
	if(gamepad_is_connected(0))
	{
		if Pface_x || Pface_b { 
			close_inv();
        }
		if Pshoulder_r && hotbarsel < hotbarsize { hotbarsel++; audio_play_sound(sndSelect,0,0,global.sndvol); }
		hotbarsel = hotbarsel mod hotbarsize;
		//selecteditem = selecteditem mod invsize;
		if(Pshoulder_l)
		{
			audio_play_sound(sndSelect,0,0,global.sndvol);
			if(hotbarsel > 0)
			{
				hotbarsel--;
			}
			else
			{
				hotbarsel = hotbarsize-1;
			}
		}
		
		if Pdpad_u && selecteditem >= 10 { selecteditem -= 10; audio_play_sound(sndSelect,0,0,global.sndvol);}
		if Pdpad_d && selecteditem < invsize-10 { selecteditem += 10; audio_play_sound(sndSelect,0,0,global.sndvol);}
		if Pdpad_r && selecteditem < invsize-1 { selecteditem++; audio_play_sound(sndSelect,0,0,global.sndvol);}
		if Pdpad_l && selecteditem > 0 { selecteditem--; audio_play_sound(sndSelect,0,0,global.sndvol); }
		if Pface_y hotbar[hotbarsel] = selecteditem;
		invmousex += gamepad_axis_value(0, gp_axislh)*4*global.fpsmode;
		invmousey += gamepad_axis_value(0, gp_axislv)*4*global.fpsmode;
		if gamepad_button_check_pressed(0,gp_select) inventory_sort();
	}
	else
	{
		if(os_type == os_windows || os_type == os_macosx || os_type == os_operagx)
		{

			if(keyboard_check_pressed(ord("E")) && invmode == 0 || keyboard_check_pressed(ord("F")) && invmode == 1 || keyboard_check_pressed(vk_escape))
			{ 
				close_inv();
			}
			else if(keyboard_check_pressed(ord("E")) && invmode != 0) invmode = 0;
			else if(keyboard_check_pressed(ord("F")) && invmode != 1) invmode = 1;
			if mouse_wheel_down() && hotbarsel < invsize { hotbarsel++; audio_play_sound(sndSelect,0,0,global.sndvol);}
			selecteditem = selecteditem mod invsize
			hotbarsel = hotbarsel mod hotbarsize;
			if(mouse_wheel_up())
			{
				audio_play_sound(sndSelect,0,0,global.sndvol);
				if(hotbarsel > 0)
				{
					hotbarsel--;
				}
				else
				{
					hotbarsel = hotbarsize-1;
				}
			}
			if keyboard_check_pressed(ord("W")) && selecteditem >= 10 { selecteditem -= 10; audio_play_sound(sndSelect,0,0,global.sndvol); }
			if keyboard_check_pressed(ord("S")) && selecteditem < invsize-10 { selecteditem += 10; audio_play_sound(sndSelect,0,0,global.sndvol); }
			if keyboard_check_pressed(ord("D")) && selecteditem < invsize-1 { selecteditem++; audio_play_sound(sndSelect,0,0,global.sndvol); }
			if keyboard_check_pressed(ord("A")) && selecteditem > 0  { selecteditem--; audio_play_sound(sndSelect,0,0,global.sndvol); }
			if keyboard_check_pressed(ord("V")) inventory_sort();
			
			if(prevmousex != device_mouse_x_to_gui(0) && prevmousex != device_mouse_y_to_gui(0))
			{
				invmousex = device_mouse_x_to_gui(0);
				invmousey = device_mouse_y_to_gui(0);
			}
			
		}
        if(os_type == os_android || os_type == os_ios)
        {
            if(keyboard_check_pressed(vk_backspace)) close_inv();
            
            //creo que esto también es útil aquí idk
            if(prevmousex != device_mouse_x_to_gui(0) && prevmousex != device_mouse_y_to_gui(0))
			{
				invmousex = device_mouse_x_to_gui(0);
				invmousey = device_mouse_y_to_gui(0);
			}
        }
	}
	
	//global on inventory
	if (mouse_check_button_pressed(mb_left) || Pface_a)
	{
		//crafteo
		if(invmousex > craftx-4 && invmousex < craftx+104 && invmousey > crafty-16 && invmousey < crafty)
		{
			craftmove = true;
			audio_play_sound(sndAccept,0,0,global.sndvol);
		}
		/*
		if(invmousex > craftx && invmousex < craftx+48 && invmousey > crafty && invmousey < crafty+16)//crafting grid
		{
			var _sx = (invmousex-craftx)>>4;
			audio_play_sound(sndSelect,0,0,global.sndvol);
			
			//drag (crafteo)!11!
			var preinv = crafting_grid[_sx]
			crafting_grid[_sx] = selector;
			selector = preinv;
			craftresult = [0,0,0,0,0];
			craftable = get_craftable_items(inventory);
            
		}
		*/
		var craftableresults = array_length(craftable);//craftable results
		
		if(craftableresults >= 1)
		{
			var _itemsperow = 6;
			var _slotsy = (((5+craftableresults) div _itemsperow)<<4)
			
			if(invmousex > craftx && invmousex < craftx+(craftableresults<<4) && invmousey > crafty+24 && invmousey < crafty+24+_slotsy)
			{
                
				var _ix = (invmousex-craftx)>>4;//qué slot del craftable?
				var _iy = (((invmousey-8)-crafty)>>4)-1;
				var _i = (_iy*_itemsperow)+_ix;
				
				if(craftableresults > _i)
				{
					if(keyboard_check(vk_shift))
					{
						while(craftable[_i][0] == craftresult[0] || craftresult[0] == 0)
		                {
							set_craft_target(_i);
		                }
						audio_play_sound(sndSelect,0,0,global.sndvol);	
					}
					else
					{
		                if(craftable[_i][0] == craftresult[0] || craftresult[0] == 0)
		                {
							set_craft_target(_i);
							audio_play_sound(sndSelect,0,0,global.sndvol);	
		                }
		                else {
		                	audio_play_sound(sndInvalid,0,0,global.sndvol);
		                }
					}
				}
			}
		}
		if(invmousex > craftx+80 && invmousex < craftx+96 && invmousey > crafty && invmousey < crafty+16)//craftear algo
		{
			do_craft();
		}
		
		//inventario
		if(invmousex > invx-4 && invmousex < invx+164 && invmousey > invy-16 && invmousey < invy)
		{
			invmove = true;
			audio_play_sound(sndAccept,0,0,global.sndvol);
		}
		
		if(invmousex > invx && invmousex < invx+160 && invmousey > invy && invmousey < invy+64)//si está dentro de los slots
		{
			var _sx = (invmousex-invx)>>4
			var _sy = (invmousey-invy)>>4
			selecteditem = _sx+(10*_sy);
			audio_play_sound(sndAccept,0,0,global.sndvol);
			
			// Drag!!1
			if(inventory[selecteditem][0] == selector[0] && selector[0] > 99)
			{
				inventory[selecteditem][1] += selector[1];
				selector = [0,0,0];
			}
			var preinv = inventory[selecteditem];
			inventory[selecteditem] = selector;
			selector = preinv;	
		}
	}
	if (device_mouse_check_button_released(0,mb_left) || gamepad_button_check_released(0,gp_face1))
	{
		invmove = false;
		craftmove = false;
	}
	
	if(invmove)
	{
		invx += invmousex-previnvmousex;
		invy += invmousey-previnvmousey;
	}
	if(craftmove)
	{
		craftx += invmousex-previnvmousex;
		crafty += invmousey-previnvmousey;
	}
}
else//fuera del inventario
{
#region pc input
if(os_type == os_windows || os_type == os_macosx || os_type == os_operagx)
{
	if keyboard_check_pressed(vk_escape) instance_create_depth(x,y,0,objPause);
	if keyboard_check_pressed(vk_shift) running = !running;
    _move = keyboard_check(ord("W")) - keyboard_check(ord("S"));
	_smove = keyboard_check(ord("A")) - keyboard_check(ord("D"));
	if keyboard_check_pressed(ord("E"))
	{ 
		invmode = 0;
		open_inv();
	}
	if keyboard_check_pressed(ord("F"))
	{ 
		invmode = 1;
		open_inv();
	}
	
	if mouse_wheel_down() && hotbarsel < hotbarsize hotbarsel++;
	hotbarsel = hotbarsel mod hotbarsize;
	if(mouse_wheel_up())
	{
		if(hotbarsel > 0)
		{
			hotbarsel--;
		}
		else
		{
			hotbarsel = hotbarsize-1;
		}
	}
    if(keyboard_check(vk_space))
    {
        if(z == 0)
        {
            zspeed = jumpf;
            grav = GRAV_JUMP;
        }
    }
    else {
    	grav = GRAV_NORMAL;
    }
	if(window_mouse_get_locked()) {
	camz = clamp(camz + (clamp(window_mouse_get_delta_y() / 200,-0.15,0.15) * (abs(camz) + 1)),-4,4);
		turn_speed = lerp(turn_speed,clamp(-window_mouse_get_delta_x() / 3,-15,15),0.75);
	} else turn_speed = 0;
	
	cam_yaw -= turn_speed;
	
	if device_mouse_check_button_pressed(0,mb_left) event_user(15);//left click
    if keyboard_check_pressed(ord("M")) event_user(15);
    
    if device_mouse_check_button_pressed(0,mb_right) event_user(14);//right click
    if keyboard_check_pressed(ord("N")) event_user(14);
}
#endregion
#region gamepad input
if(gamepad_is_connected(0))
{
	//revisar si más jugadores se unen
	check_new_player(1);
	//pausar
	if gamepad_button_check_pressed(0,gp_start) {instance_create_depth(0,0,0,objPause);}
	if Pface_b running = !running;
    if (gamepad_button_check_pressed(0, gp_stickl)) {
        running = !running;
    }
    if(Dface_a)
    {
        if(z == 0)
        {
            zspeed = jumpf;
            grav = GRAV_JUMP;
        }
    }
    else {
    	grav = GRAV_NORMAL;
    }
    _move = -round(gamepad_axis_value(0, gp_axislv))
	_smove = -round(gamepad_axis_value(0, gp_axislh))
	camz = clamp(camz + (clamp(gamepad_axis_value(0, gp_axisrv)*global.fpsmode*0.08,-0.15*global.fpsmode,0.15*global.fpsmode) * (abs(camz) + 1)),-4,4);
	cam_yaw += gamepad_axis_value(0, gp_axisrh)*4*global.fpsmode;
	if Pshoulder_r && hotbarsel < hotbarsize hotbarsel++;
	hotbarsel = hotbarsel mod hotbarsize;
	if(Pshoulder_l)
	{
		if(hotbarsel > 0)
		{
			hotbarsel--;
		}
		else
		{
			hotbarsel = hotbarsize-1;
		}
	}
	
	
	gamepad_set_vibration(0,hurt_tic,hurt_tic);
	if gamepad_button_check_pressed(0, gp_select) display_info = !display_info;
	if Pface_x open_inv(); invmode = 1; invmousex = gw>>1; invmousey = gh>>1;
	if Pface_y open_inv(); invmode = 0; invmousex = gw>>1; invmousey = gh>>1;
	if Pshoulder_rb event_user(15);
	if Pshoulder_lb event_user(14);
}
#endregion
#region phones input
if(os_type == os_android || os_type == os_ios)
{
    if keyboard_check_pressed(vk_backspace) instance_create_depth(x,y,0,objPause);
	for(var i = 0; i < 2; i++)
	{
		if(device_mouse_check_button(i, mb_left))
		{
			var dx = gw * invdpadx;
			var dy = gh * invdpady;
			var ds = round(gh * 0.15);
			var touch_x = mousex[i];
			var touch_y = mousey[i];

			var touching_dpad = (touch_x >= dx && touch_x <= dx + (ds * 3) &&
								 touch_y >= dy && touch_y <= dy + (ds * 3));

			if (touching_dpad) {
				if (touch_x >= dx && touch_x <= dx + (ds * 3) && touch_y >= dy && touch_y <= dy + ds) {
					_move = 1; // Arriba
				}
				if (touch_x >= dx && touch_x <= dx + ds && touch_y >= dy && touch_y <= dy + (ds * 3)) {
					_smove = 1; // Izquierda
				}
				if (touch_x >= dx + (ds * 2) && touch_x <= dx + (ds * 3) && touch_y >= dy && touch_y <= dy + (ds * 3)) {
					_smove = -1; // Derecha
				}
				if (touch_x >= dx && touch_x <= dx + (ds * 3) && touch_y >= dy + (ds * 2) && touch_y <= dy + (ds * 3)) {
					_move = -1; // Abajo
				}
			}
			else
			{
				// Detección de botones
				var ax = gw * buttonax;
				var ay = gh * buttonay;
				var bx = gw * buttonbx;
				var by = gh * buttonby;
				var ix = gw * buttonix;
				var iy = gh * buttoniy;

				if (touch_x >= ax && touch_x <= ax + ds && touch_y >= ay && touch_y <= ay + ds) {
                    if(z == 0)
                    {
                        zspeed = jumpf;
                        grav = GRAV_JUMP;
                    }
                }
                else
                {
            	    grav = GRAV_NORMAL;
				}
				if (touch_x >= bx && touch_x <= bx + ds && touch_y >= by && touch_y <= by + ds) {
					running = !running;
				}
				if (touch_x >= ix && touch_x <= ix + ds && touch_y >= iy && touch_y <= iy + ds) {
					invopen = true;
				}

				if(device_mouse_check_button_pressed(i, mb_left))
				{
					prevmousex_r[i] = mousex_r[i];
					prevmousey_r[i] = mousey_r[i];
                    event_user(15);//wow, se tocó la pantalla, increíble
                    event_user(14);//wow, se tocó la pantalla, increíble
				}
				// Cámara
				cam_yaw += (mousex_r[i] - prevmousex_r[i]) * 0.25;
				camz = clamp(camz + (clamp((mousey_r[i] - prevmousey_r[i]) * 0.0025, -0.15, 0.15) * (abs(camz) + 1)), -4, 4);
			}
		}
	}
}


#endregion
    #endregion
}
#region movement
if(_move != 0) {
    f_sp += _move * ((sign(f_sp) != _move) ? 0.3 : 0.15);
    f_sp = clamp(f_sp, -mspeed, mspeed);
} else {
    var _s = sign(f_sp);
    f_sp -= _s * 0.1;
    if(_s != sign(f_sp)) f_sp = 0;
}

if(_smove != 0) {
    s_sp += _smove * ((sign(s_sp) != _smove) ? 0.3 : 0.15);
    s_sp = clamp(s_sp, -mspeed, mspeed);
} else {
    var _s = sign(s_sp);
    s_sp -= _s * 0.1;
    if(_s != sign(s_sp)) s_sp = 0;
}
if (room == dungeon || room == cave) {
	
	var hitbox = 7; // Distancia desde el centro del jugador
    var _tile_x, _tile_y;
    var _xmove = lengthdir_x(f_sp, ((360 - cam_yaw) + 360) mod 360);
    var _ymove = lengthdir_y(f_sp, ((360 - cam_yaw) + 360) mod 360);
    
    _tile_x = ((x + _xmove + sign(_xmove) * hitbox) / 16)<<0;
    _tile_y = (y / 16)<<0;
    if (tiles[_tile_x][_tile_y] == 1) {
        while (tiles[floor((x + sign(_xmove) * 0.05 + sign(_xmove) * hitbox) / 16)][_tile_y] != 1) {
            x += sign(_xmove) * 0.05;
        }
        _xmove = 0;
    }
    
    _tile_x = (x / 16)<<0;
    _tile_y = ((y + _ymove + sign(_ymove) * hitbox) / 16)<<0;
    if (tiles[_tile_x][_tile_y] == 1) {
        while (tiles[_tile_x][floor((y + sign(_ymove) * 0.05 + sign(_ymove) * hitbox) / 16)] != 1) {
            y += sign(_ymove) * 0.05;
        }
        _ymove = 0;
    }
    
    x += _xmove;
    y += _ymove;
    
    _xmove = lengthdir_x(s_sp, ((360 - cam_yaw + 90) + 360) mod 360);
    _ymove = lengthdir_y(s_sp, ((360 - cam_yaw + 90) + 360) mod 360);
    
    _tile_x = floor((x + _xmove + sign(_xmove) * hitbox) / 16);
    _tile_y = y>>4;
    if (tiles[_tile_x][_tile_y] == 1) {
        while (tiles[floor((x + sign(_xmove) * 0.02 + sign(_xmove) * hitbox) / 16)][_tile_y] != 1) {
            x += sign(_xmove) * 0.02;
        }
        _xmove = 0;
    }
    
    _tile_x = x>>4;
    _tile_y = floor((y + _ymove + sign(_ymove) * hitbox) / 16);
    if (tiles[_tile_x][_tile_y] == 1) {
        while (tiles[_tile_x][floor((y + sign(_ymove) * 0.02 + sign(_ymove) * hitbox) / 16)] != 1) {
            y += sign(_ymove) * 0.02;
        }
        _ymove = 0;
    }
    
    x += _xmove;
    y += _ymove;
}
else {

	//esto es muy lento y horrible
	
var inst = instance_position(x, y, objChunk);
var _cblocks = (inst != noone && variable_instance_exists(inst, "blocks")) ? inst.blocks : _empty_blocks;
var _block_array = [
    [0, 0, 0],
    [0, 0, 0],
    [0, 0, 0]
];
var _x = rcx >> 0; // Coordenada X del bloque actual dentro del chunk
var _y = rcy >> 0; // Coordenada Y del bloque actual dentro del chunk
var _z = 0; // Temporal (solo Z=0 por ahora)

for (var j = -1; j < 2; j++) {
    for (var i = -1; i < 2; i++) {
        
        // Calcular posición del bloque a verificar
        var local_x = _x + i;
        var local_y = _y + j;
        
        // Ajustar coordenadas al rango 0-15 y calcular chunk adyacente
        var adjusted_x = local_x & 15; // Equivalente a módulo 16
        var adjusted_y = local_y & 15;
        var chunk_offset_x = (local_x - adjusted_x) div 16; // Desplazamiento en chunks
        var chunk_offset_y = (local_y - adjusted_y) div 16;
        
        var _block = 0;
        if (chunk_offset_x == 0 && chunk_offset_y == 0) {
            // Bloque está en el chunk actual
            _block = _cblocks[adjusted_x][adjusted_y][_z];
        } else {
            // Buscar chunk adyacente
            var target_x = x + chunk_offset_x * CHUNK_SIZE;
            var target_y = y + chunk_offset_y * CHUNK_SIZE;
            var neighbor_inst = instance_position(target_x, target_y, objChunk);
            if (neighbor_inst != noone && variable_instance_exists(neighbor_inst, "blocks")) {
                _block = neighbor_inst.blocks[adjusted_x][adjusted_y][_z];
            }
        }
        
        // Actualizar array de colisiones
        _block_array[i+1][j+1] = (_block != 0) ? 1 : 0;

    }
}
_xmove = lengthdir_x(f_sp, ((360 - cam_yaw) + 360) mod 360);
_ymove = lengthdir_y(f_sp, ((360 - cam_yaw) + 360) mod 360);
_xmove += lengthdir_x(s_sp, ((360 - cam_yaw + 90) + 360) mod 360);
_ymove += lengthdir_y(s_sp, ((360 - cam_yaw + 90) + 360) mod 360);
/*
// Calcular posición relativa dentro del bloque (para colisiones precisas)
var x_rel = (x mod 16) / 16;
var y_rel = (y mod 16) / 16;

var hitbox = 7/16;

var xnext = (x_rel+_xmove/16);
var ynext = (y_rel+_ymove/16);

//revisar si en la próxima posición hay un bloque
if(_block_array[1+xnext>>0][1])//si hay un bloque, retroceder
{
	f_sp*=0;
	s_sp*=0;
}
else//o si no revisamos también en Y
{
	if(_block_array[1+xnext>>0][1+ynext>>0])//colisión en la diagonal
	{
		f_sp*=0;
		s_sp*=0;
	}
	else//ninguna colisión en el eje X, avanza todo
	{
		x+=_xmove;
	}
}
//por último, revisamos si podemos mover en el eje Y
if(_block_array[1][1+ynext>>0])
{
	f_sp*=0;
	s_sp*=0;
}
else//no hay nada en el eje Y, avanza todo
{
	y+=_ymove;
}

*/

collide_and_move_between_blocks(_xmove,_ymove,4,_block_array)
//show_debug_message(_block_array);
}



#endregion
#region camera
cam_yaw = (cam_yaw + 360) mod 360;

//Where the camera is pointing to
var xfrom = x;
var yfrom = y;


var _z = -22 + (sin(sin_tic *0.1) * 0.02);

var xto = xfrom + dcos(cam_yaw);
var yto = yfrom + dsin(cam_yaw);
var zto = camz + (sin(sin_tic *0.1) * 0.01);


var swayspeed = 0;
if(z == 0)
{
    swayspeed = 1;
}
else 
{
    swayspeed = 0.5;
}

sway_amount = clamp(abs(s_sp) + abs(f_sp),-mspeed,mspeed);

sin_tic += sway_amount*swayspeed;

sway_x += sway_amount *0.7*swayspeed;
sway_y += sway_amount *1.3*swayspeed;

itemangle*=0.85;
//Update the camera
mat = matrix_build_lookat(xfrom, yfrom,z+_z, xto, yto,z+_z + zto, 0, 0, 1);
camera_set_view_mat(view_camera[0], mat);
//3D audio
audio_listener_position(x,y,z);
audio_listener_orientation(xto, yto, z+_z, 0, 0, 1);
#endregion

//to help the 3D models render faster
update3Dindex++;

if(global.update3Dtime == update3Dindex)
{
	if(prevcamyaw != cam_yaw)
	{
		global.update3d = true;
		update_world();
		var cam_yawp90 = cam_yaw+90;
		global.sincyphp = dsin(cam_yawp90);
		global.coscyphp = dcos(cam_yawp90);
	}
	else
	{
		global.update3d = false;
		instance_deactivate_object(objVisioncol);
	}
	prevcamyaw = cam_yaw;
	
	update3Dindex = 0;
}
if prevhotbarsel != hotbarsel get_hand_text();

if(_health <= 0)
{
	level = 0;
	experience = 0;
	x = 0;
	y = 0;
	_health = maxhealth;
}
speed*=0.9;