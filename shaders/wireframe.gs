#version 450 core

layout (triangles) in;
layout (line_strip, max_vertices = 4) out;

in GSPacket
{
	float intensity;
	vec2 uv;
}inputVertex[];

out FSPacket
{
	float intensity;
	vec2 uv;
}outputVertex;

void main()
{
	gl_Position = gl_in[0].gl_Position;
	outputVertex.intensity = inputVertex[0].intensity;
	outputVertex.uv = inputVertex[0].uv;
	EmitVertex();

	gl_Position = gl_in[1].gl_Position;
	outputVertex.intensity = inputVertex[1].intensity;
	outputVertex.uv = inputVertex[1].uv;
	EmitVertex();
		
	EndPrimitive();

	// //

	gl_Position = gl_in[2].gl_Position;
	outputVertex.intensity = inputVertex[2].intensity;
	outputVertex.uv = inputVertex[2].uv;
	EmitVertex();

	gl_Position = gl_in[0].gl_Position;
	outputVertex.intensity = inputVertex[0].intensity;
	outputVertex.uv = inputVertex[0].uv;
	EmitVertex();
		
	EndPrimitive();
}