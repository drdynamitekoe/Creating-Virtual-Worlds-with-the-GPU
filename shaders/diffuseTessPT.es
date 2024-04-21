#version 460

// We'll do coordinate transforms for each tessellated vertex here
layout (location = 3) uniform mat4          modelMatrix;
layout (location = 4) uniform mat4          viewMatrix;
layout (location = 5) uniform mat4          projMatrix;

layout (triangles, fractional_even_spacing, ccw) in;

in ControlPoint {
  float    intensity;
  vec2    texCoord;
  vec3 worldPos; 
  vec3 rv; 
  vec3 normal;
} inControlPoints[];

out ControlPoint {
  float    intensity;
  vec2    texCoord;
  vec3 worldPos; 
  vec3 rv; 
  vec3 normal;
} outputVertex;

void main() {

 // For triangle - get barycentric coords
  float a = gl_TessCoord.x;
  float b = gl_TessCoord.y;
  float c = gl_TessCoord.z;

  // Interpolate intensity
  outputVertex.intensity = inControlPoints[0].intensity * a + 
                        inControlPoints[1].intensity * b +
                        inControlPoints[2].intensity * c;                         
  
  // Interpolate texture coordiante
  outputVertex.texCoord = inControlPoints[0].texCoord * a +
                          inControlPoints[1].texCoord * b +
                          inControlPoints[2].texCoord * c;                        
  
  // Interpolate worldPos coordiante
  outputVertex.worldPos = inControlPoints[0].worldPos * a +
                          inControlPoints[1].worldPos * b +
                          inControlPoints[2].worldPos * c;                        
  
  // Interpolate rv coordiante
  outputVertex.rv = inControlPoints[0].rv * a +
                          inControlPoints[1].rv * b +
                          inControlPoints[2].rv * c;
  
  // Interpolate position in patch given domain coord (a, b, c) and control points from the control shader
  vec3 pos = gl_in[0].gl_Position.xyz * a +
             gl_in[1].gl_Position.xyz * b + 
             gl_in[2].gl_Position.xyz * c;         
             
    gl_Position   = (projMatrix * viewMatrix * modelMatrix * vec4(pos.xyz, 1.0));
}

