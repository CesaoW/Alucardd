// Movimento horizontal
var spdd = is_transformed ? trans_spd : spd;
var move = -keyboard_check(inputs.left) + keyboard_check(inputs.right);

if (move != 0) {
    image_xscale = move;
}

vel_x = move * spdd;
x += vel_x;
// Pulo
if (keyboard_check_pressed(inputs.jump) && no_chao) {
    vel_y = vel_pulo;
    no_chao = false;
}

// Transformação
if (keyboard_check_pressed(inputs.trans)) {
    is_transformed = !is_transformed;

    if (is_transformed) {
        sprite_index = trans_sprite;
        show_debug_message("TRANSFORMADO!");
    } else {
        sprite_index = normal_sprite;
        show_debug_message("REVERTIDO!");
    }
}