vertex_format_begin();
vertex_format_add_position_3d();
vertex_format_add_color();
vertex_format_add_texcoord();
global.f = vertex_format_end();

screen = -1;
if(debug_mode)
{
	show_debug_log(true);
}
randomize();
global.worldname = "";
#macro WORLDIR working_directory+"save/"

global.font = font_add_sprite_ext(sprFont,"1234567890ABCDEFGHIJKLMNÑOPQRSTUVWXYZaábcdeéfghiíjklmnñoópqrstuúüvwxyz*/\"':;.,¡!¿?-~()[]{}<>\\@#$%➤",1,1);
global.font2 = font_add_sprite_ext(sprFont2,"ÀÁÉËÍÓÚß§©!\"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_abcdefghijklmnopqrstuvwxyz{}~ÇÜéäàçëèïìÄÉæÆöòùÿÖÜ£áíóúñÑ¬¡«»",1,1);
draw_set_font(global.font);

ini_open(working_directory+"options.ini");

global.render_distance = ini_read_real("options","render_distance",4);
global.fpsmode = ini_read_real("options","fpsmode",1);
var factor = round(window_get_height() / 270);
global.uisize = ini_read_real("options","uisize",factor);
global.update3Dtime = ini_read_real("options","update3Dtime",1);
global.screendiv = ini_read_real("options","screendiv",0);
global.fog = ini_read_real("options","fog",1);
global.musvol = ini_read_real("options","musvol",0.125);
global.sndvol = ini_read_real("options","sndvol",1);
global.bigui = ini_read_real("options","bigui",0);//unused
global.hd = ini_read_real("options","hd",1);

audio_play_sound(musTitle,0,0,global.musvol);


ini_close();

switch(os_browser)
{
	case browser_opera:
	case browser_safari:
	case browser_edge:
	case browser_ie: //lol
	global.fog = false;
	break;
}

draw_set_font(global.font2);
draw_set_valign(fa_middle);
draw_set_halign(fa_center);

//macros
#macro CHUNK_SIZE 256


global.text = {
	title : {
		en :{
			play : "Play",
			settings : "Settings",
			exitGame : "Exit Game",
			loadWorld : "Load world",
			createWorld : "Create new world",
			done : "Done",
			renderDistance : "Render distance: ",
			screenResolution : "Screen resolution: ",
			uiSize : "Ui size: ",
			fpsRate : "Fps rate: ",
			graphicsQuality : "Graphics quality: ",
			worldName : "World name: ",
			seed : "Seed: "
		},
		es : {
			play : "Jugar",
			settings : "Ajustes",
			exitGame : "Salir del juego",
			loadWorld : "Cargar partida",
			createWorld : "Nuevo archivo",
			done : "Listo",
			renderDistance : "Distancia de render: ",
			screenResolution : "Resolución: ",
			uiSize : "Tamaño de interfaz: ",
			fpsRate : "FPS Máximos: ",
			graphicsQuality : "Calidad visual: ",
			worldName : "Nombre del mundo: ",
			seed : "Semilla: "
		}
	},
	inventory : {
		en : {
		inventory : "Inventory",
		crafting : "Crafting",
		character : "Character",
		def : "Def",
		sp : "Sp",
		},
		es : {
		inventory : "Inventario",
		crafting : "Creación",
		character : "Personaje",
		def : "Def",
		sp : "Sp",
		}
	}
}
