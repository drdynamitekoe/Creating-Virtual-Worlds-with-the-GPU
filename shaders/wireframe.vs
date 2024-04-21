#version 450 core

layout (location = 0) in vec3               vertexPos_VS;	  	// Position in attribute location 0
layout (location = 1) in vec2               texCoord_VS;
layout (location = 2) in vec3               vertexNormal_VS;

layout (location = 3) uniform mat4          modelMatrix;
layout (location = 4) uniform mat4          gVP;

layout (location = 5) uniform vec3          gCP;
layout (location = 6) uniform vec3          lightPosition;

out GSPacket
{
	float intensity;
	vec2 uv;
}outputVertex;

void main()
{    
	vec3 mpos   = (modelMatrix * vec4(vertexPos_VS, 1.0)).xyz;
	
	outputVertex.uv = texCoord_VS;
    
    vec3 Normal 	   = (modelMatrix * vec4(vertexNormal_VS, 0.0)).xyz;     
    vec3 N = normalize(Normal);

    vec3 lightDir  = lightPosition - mpos;
    vec3 L = normalize(lightDir);
	
	outputVertex.intensity = dot(N, L);
	
	gl_Position = gVP * vec4(mpos, 1.0);
}

