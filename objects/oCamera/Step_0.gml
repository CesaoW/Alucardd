if not instance_exists(target_) exit;

var margem_y = 50; // Margem de tolerância antes da câmera se mover
var suavizacao = 0.1; // Suavização geral da câmera

x = lerp(x, target_.x, 0.1);

// Se o jogador sair da dead zone para cima ou para baixo, a câmera segue
if abs(y - (target_.y - height_/8)) > margem_y {
    y = lerp(y, target_.y - height_/8, suavizacao);
}

camera_set_view_pos(view_camera[0], x - width_/2, y - height_/2);