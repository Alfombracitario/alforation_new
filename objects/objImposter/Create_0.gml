v = vertex_create_buffer();

vertex_begin(v,global.f);
vertex_end(v);

damage = 0;
tile_index=0;
tw = 0;
th = 0;
tree = 0;
uv = [];
activated = false;
rotation = 0;
hp = 0;
image_xscale = 2;
image_yscale = image_xscale;
chunk_id = 0;
particles = [];