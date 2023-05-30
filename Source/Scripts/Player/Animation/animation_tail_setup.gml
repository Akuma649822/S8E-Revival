/// animation_tail_setup()
// Script used to apply the tail parts for Tails.
switch (animation)
{
    case "IDLE":
    case "BORED_1":
    case "BORED_2":
    case "LOOK_UP":
    case "CROUCH":
    case "GRAB":
    {
        animation_tail_apply(spr_tail_part_1, 0.14, animation_direction * -14, 2, 0, animation_direction);
        break;
    }
    case "PUSH":
    {
        animation_tail_apply(spr_tail_part_3, 0.14, animation_direction * 11, 2, 0, animation_direction);
        break;
    }
    case "SKID":
    case "SKID_TURN":
    {
        animation_tail_apply(spr_tail_part_1, 0.14, animation_direction * -10, 2, 0, animation_direction);
        break;
    }
    case "ROLL":
    {
        animation_tail_apply(spr_tail_part_3, 0.25, 0, 0, tails_tail_angle, tails_tail_direction);
        break;
    }
    case "SPINDASH":
    {
        animation_tail_apply(spr_tail_part_2, 0.50, animation_direction * -16, 2, 0, animation_direction);
        break;
    }
    case "RUN":
    {
        if (abs(x_speed) < 8)
        {
            animation_tail_apply(spr_tail_part_5, 0.25 + abs(x_speed) / 25, animation_direction * -2, -3, animation_angle, animation_direction);
        }
        else
        {
            animation_tail_apply(spr_tail_part_6, 0.25 + abs(x_speed) / 25, animation_direction * -2, -3, animation_angle, animation_direction);
        }
        break;
    }
    case "FLY":
    case "FLY_DROP":
    {
        animation_tail_apply(spr_tail_part_4, 0.25, animation_direction * -4, -11, 0, animation_direction);
        break;
    }
    default:
    {
        animation_tail_apply(noone);
        break;
    }
}
