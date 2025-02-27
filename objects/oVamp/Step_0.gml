var spdd = is_transformed ? trans_spd : spd;
var move = -keyboard_check(inputs.left)+keyboard_check(inputs.right);

if (move != 0) {
    image_xscale = move;
}

var hsp = move*spdd;

x +=hsp

if (!no_chao){
	vel_y += gravidade	
}

if (keyboard_check_pressed(inputs.jump) && no_chao) {
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

if x<0{hsp= -hsp}
if x>room_width{hsp= -hsp}

if(keyboard_check_pressed(inputs.trans)){
	is_transformed =!is_transformed;
	
	if(is_transformed){
		sprite_index = trans_sprite;
		show_debug_message("TRANSFORMADO!")
	}else{
		sprite_index =normal_sprite;
		show_debug_message("REVERTIDO!")
	}
}