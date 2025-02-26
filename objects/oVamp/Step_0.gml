if keyboard_check(vk_right){
	x += vel_x
}

if keyboard_check(vk_left){
	x-= vel_x
}

if (!no_chao){
	vel_y += gravidade	
}

if (keyboard_check_pressed(vk_space) && no_chao) {
    vel_y = vel_pulo;
    no_chao = false;
}

y += vel_y


if(place_meeting(x,y,oChao)){
	no_chao = true;
    vel_y = 0;
   if (vel_y >= 0) {
        move_contact_solid(270, abs(vel_y)); // 270° = para baixo
    }
}else{
	no_chao = false
}