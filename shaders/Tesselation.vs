#version 450 core

layout (location = 0) in vec3               vertexPos_VS;	  	// Position in attribute location 0
layout (location = 1) in vec2               texCoord_VS;
layout (location = 2) in vec3               vertexNormal_VS;

layout (location = 3) uniform mat4          modelMatrix;
layout (location = 4) uniform mat4          gVP;

layout (location = 5) uniform vec3          gCP;
layout (location = 6) uniform vec3          lightPosition;

out vec2 TexCoord;


//////////////////////////////////////////////////////////////////
// main()
//////////////////////////////////////////////////////////////////
void main()
{    
	vec3 mpos = (modelMatrix * vec4(vertexPos_VS, 1.0)).xyz;

    TexCoord = texCoord_VS;

    gl_Position = gVP * vec4(mpos, 1.0);
}

// https://ogldev.org/www/tutorial30/tutorial30.html