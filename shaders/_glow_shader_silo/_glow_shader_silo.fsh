//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;
uniform vec3 color;

void main()
{
	vec4 base = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
    gl_FragColor = vec4(color, ceil(base.a)); //black, only allow alpha of 1 or 0
}
