//
// Example Tessellation Control Shader – simple pass through shader
//

#version 460 core

layout(vertices = 3) out;

uniform vec3 camPos;

in ControlPoint {
  float    intensity;
vec2 texCoord;
vec3 worldPos;
vec3 rv;
vec3 normal;
} inControlPoint[];

out ControlPoint {
  float    intensity;
vec2 texCoord;
vec3 worldPos;
vec3 rv;
vec3 normal;
} outControlPoint[];

void main() 
{
    // Set the control points of the output patch
    gl_out[gl_InvocationID].gl_Position = gl_in[gl_InvocationID].gl_Position;
    outControlPoint[gl_InvocationID].intensity = inControlPoint[gl_InvocationID].intensity;
    outControlPoint[gl_InvocationID].texCoord = inControlPoint[gl_InvocationID].texCoord;
    outControlPoint[gl_InvocationID].worldPos = inControlPoint[gl_InvocationID].worldPos;
    outControlPoint[gl_InvocationID].rv = inControlPoint[gl_InvocationID].rv;
    outControlPoint[gl_InvocationID].normal = inControlPoint[gl_InvocationID].normal;

    // Calculate the tessellation levels
    gl_TessLevelOuter[0] = 1.0;
    gl_TessLevelOuter[1] = 1.0;
    gl_TessLevelOuter[2] = 1.0;
    gl_TessLevelInner[0] = 1.0;

}
