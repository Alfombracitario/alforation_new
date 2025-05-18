//click derecho

//si es comida, que coma el hdp
var item = inventory[hotbar[hotbarsel]][0];
if(item >= 130 && item <= I_WATERMELON)
{
    add_item(item,-1);
    _hunger+=10;
}

//si es un bloque, colocarlo
if(item >= I_COBBLE_BLOCK)
{
	place_block();
	add_item(item,-1);
}