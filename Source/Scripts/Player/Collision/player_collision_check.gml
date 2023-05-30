/// player_collision_check(COL_SENSOR, [see script for rest of arguments])
// Checks various sensors for collision detecting.

// Cycle through sensors:
switch (argument[0])
{
    // Main sensor:
    case COL_MAIN:
    {
        // Store mask as a temporal variable.
        var maskTemp;
        maskTemp = mask_index;

        // Switch mask.
        mask_index = MASK_MAIN;

        // Test collision:
        var colTest;
        colTest = player_collision(floor(argument[1]), floor(argument[2]), collision_layer);

        // Restore previous mask.
        mask_index = maskTemp;

        // Return test:
        return colTest;
        break;
    }

    // ########################################################################################################################## //

    // Slope sensor:
    case COL_SLOPE:
    {
        // Store mask as a temporal variable.
        var maskTemp;
        maskTemp = mask_index;

        // Switch mask.
        mask_index = argument[1];

        // Test collision:
        var colTest;
        colTest = player_collision(floor(argument[2] + dsin(argument[4]) * 23),
                                   floor(argument[3] + dcos(argument[4]) * 23),
                                   collision_layer);

        // Restore previous mask.
        mask_index = maskTemp;

        // Return test:
        return colTest;
        break;
    }

    // ########################################################################################################################## //

    // Main sensor (object):
    case COL_MAIN_OBJECT:
    {
        // Store mask as a temporal variable.
        var maskTemp;
        maskTemp = mask_index;

        // Switch mask.
        mask_index = MASK_MAIN;

        // Test collision:
        var colTest;
        colTest = instance_place(floor(argument[1]), floor(argument[2]), argument[3]);

        // Restore previous mask.
        mask_index = maskTemp;

        // Return test:
        return colTest;
        break;
    }

    // ########################################################################################################################## //

    // Top sensor:
    case COL_TOP:
    {
        // Store mask as a temporal variable.
        var maskTemp;
        maskTemp = mask_index;

        // Switch mask.
        mask_index = argument[1];

        // Test collision:
        var colTest;
        colTest = player_collision(floor(argument[2] - dsin(argument[4]) * 11),
                                   floor(argument[3] - dcos(argument[4]) * 11),
                                   collision_layer);

        // Restore previous mask.
        mask_index = maskTemp;

        // Return test:
        return colTest;
        break;
    }

    // ########################################################################################################################## //

    // Top sensor (object):
    case COL_TOP_OBJECT:
    {
        // Store mask as a temporal variable.
        var maskTemp;
        maskTemp = mask_index;

        // Switch mask.
        mask_index = argument[1];

        // Test collision:
        var colTest;
        colTest = instance_place(floor(argument[2] - (dsin(argument[4])) * 11),
                                 floor(argument[3] - (dcos(argument[4])) * 11),
                                 argument[5]);

        // Restore previous mask.
        mask_index = maskTemp;

        // Return test:
        return colTest;
        break;
    }

    // ########################################################################################################################## //

    // Bottom sensor:
    case COL_BOTTOM:
    {
        // Store mask as a temporal variable.
        var maskTemp;
        maskTemp = mask_index;

        // Switch mask.
        mask_index = argument[1];

        // Test collision:
        var colTest;
        colTest = player_collision(floor(argument[2] + dsin(argument[4]) * 11),
                                   floor(argument[3] + dcos(argument[4]) * 11),
                                   collision_layer);

        if (!colTest && !ground && y_speed >= 0)
        {
            colTest = place_meeting(floor(argument[2] + dsin(argument[4]) * 11), floor(argument[3] + dcos(argument[4]) * 11), par_platform)
                  && !place_meeting(floor(argument[2]), floor(argument[3]), par_platform);
        }

        // Restore previous mask.
        mask_index = maskTemp;

        // Return test:
        return colTest;
        break;
    }

    // ########################################################################################################################## //

    // Bottom sensor (object):
    case COL_BOTTOM_OBJECT:
    {
        // Store mask as a temporal variable.
        var maskTemp;
        maskTemp = mask_index;

        // Switch mask.
        mask_index = argument[1];

        // Test collision:
        var colTest;
        colTest = instance_place(floor(argument[2] + (dsin(argument[4])) * 11),
                                 floor(argument[3] + (dcos(argument[4])) * 11),
                                 argument[5]);

        // Restore previous mask.
        mask_index = maskTemp;

        // Return test:
        return colTest;
        break;
    }

    // ########################################################################################################################## //

    // Left sensor:
    case COL_LEFT:
    {
        // Store mask as a temporal variable.
        var maskTemp;
        maskTemp = mask_index;

        // Switch mask.
        mask_index = argument[1];

        // Test collision:
        var colTest;
        colTest = player_collision(floor(argument[2] - dcos(argument[4]) * 11),
                                   floor(argument[3] + dsin(argument[4]) * 11),
                                   collision_layer);

        // Restore previous mask.
        mask_index = maskTemp;

        // Return test:
        return colTest;
        break;
    }

    // ########################################################################################################################## //

    // Left sensor (object):
    case COL_LEFT_OBJECT:
    {
        // Store mask as a temporal variable.
        var maskTemp;
        maskTemp = mask_index;

        // Switch mask.
        mask_index = argument[1];

        // Test collision:
        var colTest;
        colTest = instance_place(floor(argument[2] - (dcos(argument[4])) * 11),
                                 floor(argument[3] + (dsin(argument[4])) * 11),
                                 argument[5]);

        // Restore previous mask.
        mask_index = maskTemp;

        // Return test:
        return colTest;
        break;
    }

    // ########################################################################################################################## //

    // Left sensor (edge):
    case COL_LEFT_EDGE:
    {
        // Store mask and sprite as a temporal variable.
        var maskTemp;
        maskTemp = mask_index;

        var spriteTemp;
        spriteTemp[0] = sprite_index;
        spriteTemp[1] = image_index;

        // Switch mask and sprite.
        mask_index   = MASK_LINES;
        sprite_index = MASK_LINES;
        image_index  = floor(argument[3]);

        // Test collision:
        var colTest;
        colTest = player_collision(floor(argument[1] - dcos(argument[3]) * 8  + dsin(argument[3]) * 11),
                                   floor(argument[2] + dsin(argument[3]) * 11 + dcos(argument[3]) * 11),
                                   collision_layer);

        // Restore previous mask and sprite.
        mask_index   = maskTemp;
        sprite_index = spriteTemp[0];
        image_index  = spriteTemp[1];

        // Return test:
        return colTest;
        break;
    }

    // ########################################################################################################################## //

    // Left sensor (limiter):
    case COL_LEFT_LIMITER:
    {
        // Store mask and sprite as a temporal variable.
        var maskTemp;
        maskTemp = mask_index;

        var spriteTemp;
        spriteTemp[0] = sprite_index;
        spriteTemp[1] = image_index;

        // Wrap angle.
        wrap_angle(argument[1]);

        // Switch mask and sprite.
        mask_index   = MASK_LINES;
        sprite_index = MASK_LINES;
        image_index  = floor(argument[1] / 10);

        // Calculate position:
        var tempOffsetX, tempOffsetY;
        tempOffsetX = x - cos(floor(argument[1])) * 8 + sin(floor(argument[1])) * 10;
        tempOffsetY = y + sin(floor(argument[1])) * 8 + cos(floor(argument[1])) * 10;

        // Test collision:
        var colTest;
        colTest = player_collision(tempOffsetX, tempOffsetY, par_solid) &&
                 !place_meeting(tempOffsetX, tempOffsetY, par_obstacles);

        // Restore previous mask and sprite.
        mask_index   = maskTemp;
        sprite_index = spriteTemp[0];
        image_index  = spriteTemp[1];

        // Return test:
        return colTest;
        break;
    }

    // ########################################################################################################################## //

    // Right sensor:
    case COL_RIGHT:
    {
        // Store mask as a temporal variable.
        var maskTemp;
        maskTemp = mask_index;

        // Switch mask.
        mask_index = argument[1];

        // Test collision:
        var colTest;
        colTest = player_collision(floor(argument[2] + dcos(argument[4]) * 11),
                                   floor(argument[3] - dsin(argument[4]) * 11),
                                   collision_layer);

        // Restore previous mask.
        mask_index = maskTemp;

        // Return test:
        return colTest;
        break;
    }

    // ########################################################################################################################## //

    // Right sensor (object):
    case COL_RIGHT_OBJECT:
    {
        // Store mask as a temporal variable.
        var maskTemp;
        maskTemp = mask_index;

        // Switch mask.
        mask_index = argument[1];

        // Test collision:
        var colTest;
        colTest = instance_place(floor(argument[2] + dcos(argument[4]) * 11),
                                 floor(argument[3] - dsin(argument[4]) * 11),
                                 argument[5]);

        // Restore previous mask.
        mask_index = maskTemp;

        // Return test:
        return colTest;
        break;
    }

    // ########################################################################################################################## //

    // Right sensor (edge):
    case COL_RIGHT_EDGE:
    {
        // Store mask and sprite as a temporal variable.
        var maskTemp;
        maskTemp = mask_index;

        var spriteTemp;
        spriteTemp[0] = sprite_index;
        spriteTemp[1] = image_index;

        // Switch mask and sprite.
        mask_index   = MASK_LINES;
        sprite_index = MASK_LINES;
        image_index  = floor(argument[3]);

        // Test collision:
        var colTest;
        colTest = player_collision(floor(argument[1] + dcos(argument[3]) * 8  + dsin(argument[3]) * 11),
                                   floor(argument[2] - dsin(argument[3]) * 11 + dcos(argument[3]) * 11),
                                   collision_layer);

        // Restore previous mask and sprite.
        mask_index   = maskTemp;
        sprite_index = spriteTemp[0];
        image_index  = spriteTemp[1];

        // Return test:
        return colTest;
        break;
    }

    // ########################################################################################################################## //

    // Right sensor (limiter):
    case COL_RIGHT_LIMITER:
    {
        // Store mask and sprite as a temporal variable.
        var maskTemp;
        maskTemp = mask_index;

        var spriteTemp;
        spriteTemp[0] = sprite_index;
        spriteTemp[1] = image_index;

        // Wrap angle.
        wrap_angle(argument[1]);

        // Switch mask and sprite.
        mask_index   = MASK_LINES;
        sprite_index = MASK_LINES;
        image_index  = floor(argument[1] / 10);

        // Calculate position:
        var tempOffsetX, tempOffsetY;
        tempOffsetX = x + cos(floor(argument[1])) * 8 + sin(floor(argument[1])) * 10;
        tempOffsetY = y - sin(floor(argument[1])) * 8 + cos(floor(argument[1])) * 10;

        // Test collision:
        var colTest;
        colTest = player_collision(tempOffsetX, tempOffsetY, par_solid) &&
                 !place_meeting(tempOffsetX, tempOffsetY, par_obstacles);

        // Restore previous mask and sprite.
        mask_index   = maskTemp;
        sprite_index = spriteTemp[0];
        image_index  = spriteTemp[1];

        // Return test:
        return colTest;
        break;
    }
}
