v = vertex_create_buffer();

vertex_begin(v,global.f);
vertex_end(v);

tw = 1;
draw = false;
image_xscale = 2;
image_yscale = 2;
image_alpha = 0.5;
zlimit = -1;