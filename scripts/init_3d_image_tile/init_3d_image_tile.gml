function init_3d_image_tile(index)
{
v[index] = vertex_create_buffer();

vertex_begin(v[index],global.f);
vertex_end(v[index]);
}