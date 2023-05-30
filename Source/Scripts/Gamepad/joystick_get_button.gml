/// joystick_get_button()
// Returns a joystick button press.
for (i = 0; i <= joystick_buttons(1); i += 1)
{
    if (joystick_check_button(1, i))
    {
        return i;
    }
}
return -1;
