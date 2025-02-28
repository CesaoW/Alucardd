target_ = oVamp;
width_ = camera_get_view_width(view_camera[0]);
height_ = camera_get_view_height(view_camera[0]);

// Inicializa a posição da câmera
x = target_.x;
y = target_.y - height_/8; // Centraliza verticalmente o personagem na câmera