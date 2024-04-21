#version 450 core

//We'll do coordinate transforms for each tessellated vertex here uniform mat4 mvpMatrix;


layout (quads, equal spacing, ccw) in;

in ControlPoint {

	vec4 colour;
	vec2 texCoord;

} inControlPoints[];

out TessVertex {

	vec4 colour;
	vec2 texCoord;

} outputVertex;


void main(){    
	
float u = gl TessCoord.x;
float v = gl TessCoord.y;

float w0 = (1.0f - u) * (1.0f - v);
float w1 = u * (1.0f - v);
float w2 = u * v;
float w3 = (1.0f - u) * v;

outputVertex.colour = inControlPoints[0].colour * w0 +
		      inControlPoints[1].colour * w1 +
                      inControlPoints[0].colour * w2 +
		      inControlPoints[0].colour * w3;

outputVertex.texCoord = inControlPoints[0].texCoord * w0 +
                        inControlPoints[1].texCoord * w1 +
                        inControlPoints[2].texCoord * w2 +
                        inControlPoints[3].texCoord * w3;

vec3 pos = gl in[0].gl Position.xyz * w0 +
           gl in[1].gl Position.xyz * w1 +
           gl in[2].gl Position.xyz * w2 +
           gl in[3].gl Position.xyz * w3;

gl Position = mvpMatrix * vec4(pos , 1.0f);				
}