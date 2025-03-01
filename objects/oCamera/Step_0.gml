// Verifica se o target (jogador) existe
if !instance_exists(target_) exit;

// Configurações da câmera
var margem_x = 10; // Margem de tolerância horizontal
var margem_y = 20; // Margem de tolerância vertical
var suavizacao = 0.1; // Suavização geral da câmera
var suavizacao_rapida = 0.2; // Suavização mais rápida
var look_ahead = 100; // Distância de "look ahead"
var dir = sign(target_.hspeed); // Direção horizontal do jogador

// Limites da sala (ajuste conforme necessário)
var room_left = 0;
var room_right = room_width;
var room_top = 0;
var room_bottom = room_height;

// Ajusta o alvo da câmera com base na direção do jogador (look ahead)
var target_x = target_.x + dir * look_ahead;

// Movimento horizontal com margem de tolerância
if abs(x - target_x) > margem_x {
    x = lerp(x, target_x, suavizacao);
}

// Movimento vertical com margem de tolerância
if abs(y - (target_.y - height_/8)) > margem_y {
    y = lerp(y, target_.y - height_/8, suavizacao);
}

// Limita a posição da câmera aos limites da sala
x = clamp(x, room_left + width_/2, room_right - width_/2);
y = clamp(y, room_top + height_/2, room_bottom - height_/2);

// Define a posição da câmera
camera_set_view_pos(view_camera[0], x - width_/2, y - height_/2);