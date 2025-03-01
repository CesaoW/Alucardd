// Aplicar gravidade
if (!no_chao) {
    vel_y += gravidade;
}

// Verificar colisão vertical (chão e plataformas)
var _col_ver_chao = instance_place(x, y + vel_y, oChao); // Colisão com o chão
var _col_ver_plataforma = instance_place(x, y + vel_y, oPlataforma); // Colisão com a plataforma

// Colisão com o chão (sólido)
if (_col_ver_chao) {
    if (vel_y > 0) {
        no_chao = true;
        var dir = sign(vel_y);
        while (!place_meeting(x, y + dir, oChao)) {
            y += dir;
        }
    }
    vel_y = 0;
}

// Colisão com a plataforma (mão única)
if (_col_ver_plataforma) {
    if (vel_y > 0) {
        if (keyboard_check(inputs.down)) {
            // Ignora a colisão (passa pela plataforma)
        } else {
            // Colisão normal (sobe na plataforma)
            no_chao = true;
            var dir = sign(vel_y);
            while (!place_meeting(x, y + dir, oPlataforma)) {
                y += dir;
            }
            vel_y = 0;
        }
    }
}

// Verifica se o personagem está saindo de uma plataforma ou do chão
if (no_chao) {
    if (!place_meeting(x, y + 1, oChao) && !place_meeting(x, y + 1, oPlataforma)) {
        no_chao = false;
    }
}

// Verificar colisão horizontal (APENAS com o chão sólido)
if (vel_x != 0) {
    var _col_hor = instance_place(x + vel_x, y, oChao); // Verifica colisão apenas com o chão
    if (_col_hor) {
        var dir = sign(vel_x);
        while (!place_meeting(x + dir, y, oChao)) {
            x += dir;
        }
        vel_x = 0;
    } else {
        x += vel_x;
    }
}

// Aplica a velocidade vertical
y += vel_y;