var move = -keyboard_check(vk_left)+keyboard_check(vk_right);

if (move != 0) {
    image_xscale = move;
}
var hsp = move*spd;

x +=hsp

if (!no_chao){
	vel_y += gravidade	
}

if (keyboard_check_pressed(vk_up) && no_chao) {
    vel_y = vel_pulo;
    no_chao = false;
}

y += vel_y


if(place_meeting(x,y,oChao)){
	no_chao = true;
    vel_y = 0;
   if (vel_y >= 0) {
        move_contact_solid(270, abs(vel_y)); 
    }
}else{
	no_chao = false
}
