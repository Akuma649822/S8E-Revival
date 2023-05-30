/// stage_initialization()
// Initializes each level.
switch (room)
{
    case rm_playground:
    {
        stage_set_data("ENGINE TEST", 1, 1, -1, -1);
        global.zone_id = 1;
        break;
    }
    case rm_playground_2:
    {
        stage_set_data("ENGINE TEST", 2, 2, -1, -1);
        global.game_completed = true; // Enable the game completion flag.
        break;
    }
    default:
    {
        stage_set_data("", -1, -1, -1, -1);
        break;
    }
}

// Create stage elements:
instance_create(0, 0, obj_instance_culling);
instance_create(0, 0, obj_hud);
instance_create(0, 0, obj_parallax_ghz);

if (global.water_position != -1)
{
    instance_create(0, 0, obj_water);
}

// Create defined title card:
switch (global.title_card_style)
{
    case 3:
    {
        instance_create(0, 0, obj_title_card_s3);
        break;
    }
    case 2:
    {
        instance_create(0, 0, obj_title_card_s2);
        break;
    }
    case 1:
    {
        instance_create(0, 0, obj_title_card_s1);
        break;
    }
    default:
    {
        instance_create(0, 0, obj_fade_in);
        if (instance_exists(obj_player))
        {
            with (par_player)
            {
                initialized = true;
            }
        }
        global.add_time = true;
        break;
    }
}
