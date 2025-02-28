// Aplicar gravidade
if (!no_chao) {
    vel_y += gravidade;
}

// Verificar colisão horizontal
if (vel_x != 0) {
    var _col_hor = instance_place(x + vel_x, y, oChao);
    if (_col_hor) {
        // Ajustar posição para evitar colisão
        while (!place_meeting(x + sign(vel_x), y, oChao)) {
            x += sign(vel_x);
        }
        vel_x = 0;
    } else {
        x += vel_x; // Aplicar movimento horizontal
    }
}

// Verificar colisão vertical
if (vel_y != 0) {
    var _col_ver = instance_place(x, y + vel_y, oChao);
    if (_col_ver) {
        // Ajustar posição para evitar colisão
        while (!place_meeting(x, y + sign(vel_y), oChao)) {
            y += sign(vel_y);
        }
        if (vel_y > 0) {
            no_chao = true; // Colisão com o chão
        }
        vel_y = 0;
    } else {
        y += vel_y; // Aplicar movimento vertical
        no_chao = false;
    }
}