#version 450 core

layout(binding = 0) uniform sampler2D ColTexture;
layout(binding = 1) uniform sampler2D StencilTexture;
layout(binding = 2) uniform sampler2D FlatTexture;
layout(binding = 3) uniform samplerCube SkyboxTexture;

in FSPacket
{
	float intensity;
	vec2 uv;
}inputVertex;

out vec4 FragColor; // Color that will be used for the fragment

void main()
{
    vec4 colour = texture(ColTexture, inputVertex.uv); 

    FragColor = vec4(vec3(colour.xyz * inputVertex.intensity), 1.0);
}