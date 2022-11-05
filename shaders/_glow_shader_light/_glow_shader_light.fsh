varying vec2 v_vTexcoord;
varying vec4 v_vColour;
varying vec2 pos;
uniform vec2 u_pos; //position of the light source
uniform float u_fov;
uniform float u_dir;
uniform float u_radius;
uniform float u_falloff_speed; //how sharp is the transition from light to dark

#define PI 3.1415926538

void main()
{
	// Work out vector from room location to the light
    vec2 vect = pos - u_pos;
	
	// Length of that vector
	float dist = sqrt(vect.x * vect.x + vect.y * vect.y);
	
	//falloff light over distance (can replace this with any tweening function for different results
	float falloff = pow((dist/u_radius), u_falloff_speed);
	
	//if light isnt 360 degrees cut out the desired chunk
	float dir = radians(u_dir);
	float hfov = radians(u_fov)*0.5;
	if(hfov < PI)
	{
		float rad = atan(-vect.y, vect.x);
		float adis = abs(mod(rad+2.0*PI, 2.0*PI) - dir);
		adis = min(adis, 2.0*PI - adis);
		if(adis > hfov)
			falloff = 1.0;
	}
	
	vec4 base_col = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
	gl_FragColor = mix(base_col, vec4(0.0,0.0,0.0,1.0), falloff);
}
