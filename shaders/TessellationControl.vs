#version 450 core

layout (vertices = 4) out;

void main(){    
	
	gl out[gl InvocationID].gl Position
			    = gl in[gl InvocationID].gl Position;

// Calculate edge tessellation factors for quad
gl TessLevelOuter[0] = 3.0f;
gl TessLevelOuter[1] = 7.0f;
gl TessLevelOuter[2] = 11.0f;
gl TessLevelOuter[3] = 15.0f;

// Calculate internal tessellation factors along u and v in quad domain
gl TessLevelInner[0] = 15.0f;
gl TessLevelInner[1] =
								
}