
/// @func move_with_collision(hspd, vspd, hitbox_px, tile_array)
/// @arg hspd         Horizontal speed en píxeles/frame
/// @arg vspd         Vertical speed en píxeles/frame
/// @arg hitbox_px    Mitad de la hitbox cuadrada en píxeles (p.ej. 7)
/// @arg tile_array   Array 3×3 de booleans (1=bloque, 0=vacío)
function collide_and_move_between_blocks(_hspd,_vspd,_hitbox_px,_tile_array) {
    // 1) Delta en tiles
    var dx = _hspd/16, dy = _vspd/16;
    var half = _hitbox_px/16;
    var xr = x/16, yr = y/16;

    // 2) Prueba X
    var collidedX = false;
    if (dx != 0) {
        var nx1 = xr + dx - half, nx2 = xr + dx + half;
        var ny1 = yr - half,      ny2 = yr + half;
        var tminX = floor(nx1),   tmaxX = floor(nx2);
        var tminY = floor(ny1),   tmaxY = floor(ny2);

        for (var tx = tminX; tx <= tmaxX && !collidedX; tx++) {
            for (var ty = tminY; ty <= tmaxY; ty++) {
                var ox = clamp(tx   - floor(xr), -1, 1) + 1;
                var oy = clamp(ty   - floor(yr), -1, 1) + 1;
                if (_tile_array[ox][oy]) { collidedX = true; break; }
            }
        }
        if (collidedX) dx = 0;
    }

    // 3) Prueba Y
    var collidedY = false;
    if (dy != 0) {
        var nx1 = xr - half,      nx2 = xr + half;
        var ny1 = yr + dy - half, ny2 = yr + dy + half;
        var tminX = floor(nx1),   tmaxX = floor(nx2);
        var tminY = floor(ny1),   tmaxY = floor(ny2);

        for (var tx = tminX; tx <= tmaxX && !collidedY; tx++) {
            for (var ty = tminY; ty <= tmaxY; ty++) {
                var ox = clamp(tx   - floor(xr), -1, 1) + 1;
                var oy = clamp(ty   - floor(yr), -1, 1) + 1;
                if (_tile_array[ox][oy]) { collidedY = true; break; }
            }
        }
        if (collidedY) dy = 0;
    }

    // 4) Aplicar movimiento (vuelve a píxeles)
    x += dx * 16;
    y += dy * 16;
}
