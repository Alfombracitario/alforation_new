//main variables
hp = 75;
maxhp = hp;
state = 0;
mspeed = 0;
knockspd = 0;
drop = true;
zsize = 25;
zv = -9;
z = 16;
sw = 8;

//other 3D stuff
texture = sprite_get_texture(sprErock,0);
frame_index = 1;
uv = get_texture_coords_sprite(sprErock,frame_index)
v = vertex_create_buffer();