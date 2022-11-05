//these are safe to call whether a glow controller exists or not
//opacity
function glow_set_ambient_opacity(_val)
{
	with(_glow_controller) 
		ambient_opacity = _val;
}
function glow_get_ambient_opacity()
{
	with(_glow_controller)
		return ambient_opacity;
}

//ambient color
function glow_set_ambient_color(_col)
{
	with(_glow_controller) 
		ambient_color = _col;
}

function glow_get_ambient_color()
{
	with(_glow_controller) 
		return ambient_color;
}

function glow_set_blur(_bool)
{
	with(_glow_controller) 
		blur_pass = _bool;
}

function glow_get_blur()
{
	with(_glow_controller) 
		return blur_pass;
}