#version 330 core
out vec4 fragColor;
out vec3 fragPos;
  
in vec3 normal;

uniform vec3 objectColor;
uniform vec3 lightColor;
uniform vec3 lightPos;
uniform float ambientStr;

void main() {

    vec3 ambient = ambientStr * lightColor;
    vec3 norm = normalize(normal); 
    vec3 lightDir = normalize(lightPos - fragPos);
    float diff = max(dot(norm, lightDir), 0.0);
    vec3 diffuse = diff * lightColor;
    fragColor = vec4((ambient + diffuse) * objectColor, 1.0);
}
