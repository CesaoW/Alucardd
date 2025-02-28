// Aplicar gravidade
if (!no_chao) {
    vel_y += gravidade;
}

// Verificar colisão vertical (chão e plataformas)
var _col_ver = instance_place(x, y + vel_y, oChao);
if (_col_ver) {
    if (vel_y > 0) {
        // Colisão com o chão ou plataforma
        no_chao = true;
        var dir = sign(vel_y); // Direção do movimento (1 para baixo, -1 para cima)
        while (!place_meeting(x, y + dir, oChao)) {
            y += dir; // Move o personagem pixel a pixel
        }
    } else if (vel_y < 0) {
        // Colisão com o teto
        var dir = sign(vel_y); // Direção do movimento (1 para baixo, -1 para cima)
        while (!place_meeting(x, y + dir, oChao)) {
            y += dir; // Move o personagem pixel a pixel
        }
    }
    vel_y = 0; // Zera a velocidade vertical
} else {
    // Verifica se o personagem está saindo de uma plataforma
    if (no_chao) {
        if (!place_meeting(x, y + 1, oChao)) {
            no_chao = false; // Personagem não está mais no chão
        }
    }
}

// Verificar colisão horizontal (paredes)
if (vel_x != 0) {
    var _col_hor = instance_place(x + vel_x, y, oChao);
    if (_col_hor) {
        // Ajusta a posição manualmente para evitar colisão
        var dir = sign(vel_x); // Direção do movimento (1 para direita, -1 para esquerda)
        while (!place_meeting(x + dir, y, oChao)) {
            x += dir; // Move o personagem pixel a pixel
        }
        vel_x = 0; // Zera a velocidade horizontal após a colisão
    } else {
        x += vel_x; // Aplica o movimento horizontal se não houver colisão
    }
}

// Aplica a velocidade vertical
y += vel_y;