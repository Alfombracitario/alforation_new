function voxel_get(_x,_y,_z){//z debe estar truncado de antes
var inst = instance_position(_x, _y, objChunk);
var _cblocks = (inst != noone && variable_instance_exists(inst, "blocks")) ? inst.blocks : _empty_blocks;

var _rcx = rcx >> 0; // Coordenada X del bloque actual dentro del chunk
var _rcy = rcy >> 0; // Coordenada Y del bloque actual dentro del chunk
return _cblocks[_rcx][_rcy][0];
}