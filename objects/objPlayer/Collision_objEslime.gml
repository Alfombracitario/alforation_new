if(hurt_tic < 0)
{
	do_player_hurt(5);
    //knockback
    speed = other.speed*2;
	direction = other.direction;
}