#version 330 core
layout (location = 0) in vec3 aPos;
layout (location = 1) in vec3 aNormal;

out vec3 normal;
out vec3 fragPos;


uniform mat4 model;
uniform mat4 view;
uniform mat4 projection;
uniform vec3 lightPos;

void main() { 
    fragPos = vec3(model * vec4(aPos, 1.0));
    normal = mat3(transpose(inverse(model))) * aNormal;  // TODO: super inefficient to do - doing it right now for testing purposes
    gl_Position = projection * view * model * vec4(aPos, 1.0);
    // normal = aNormal;
}
