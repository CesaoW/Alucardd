// Sistema de movimentação
gravidade = 0.5;
vel_pulo = -5;
vel_y = 0;
vel_x = 0;
no_chao = false;

spd = 3;

inputs = {
    left: ord("A"),
    right: ord("D"),
    jump: ord("W"),
    trans: ord("T")
};

// Sistema de transformação em morcego
is_transformed = false;
trans_spd = 8;

normal_sprite = sVampeta;
trans_sprite = sMorgueco;