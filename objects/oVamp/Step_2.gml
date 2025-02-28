if (!no_chao) {
    vel_y += gravidade;
}

y += vel_y;

// Colisão com o chão
if (place_meeting(x, y, oChao)) {
    no_chao = true;
    vel_y = 0;
    if (vel_y >= 0) {
        move_contact_solid(270, abs(vel_y));
    }
} else {
    no_chao = false;
}

var _col = instance_place(x+ vel_x, y, oChao)

if(_col){
    if(vel_x>0){

    }else if(vel_x<0){

    }
    vel_x = 0;
}

var _col = instance_place(x, y + vel_y, oChao)
 
if(_col){
    if(vel_y>0){

    }else if(vel_y<0){

    }
    vel_y = 0;
}

y+= vel_y;