#version 330 core
out vec4 fragColor;

in vec3 fragPos;
in vec3 normal;

uniform vec3 objectColor;
uniform vec3 lightColor;
uniform vec3 lightPos;
uniform vec3 viewPos;
uniform float ambientStr;

void main() {

    //ambient
    vec3 ambient = ambientStr * lightColor;
    //diffuse
    vec3 norm = normalize(normal); 
    vec3 lightDir = normalize(lightPos - fragPos);
    float diff = max(dot(norm, lightDir), 0.0);
    vec3 diffuse = diff * lightColor;
    //specular
    float specularStrength = 0.3;
    vec3 viewDir = normalize(viewPos - fragPos);
    vec3 reflectDir = reflect(-lightDir, norm);  
    float spec = pow(max(dot(viewDir, reflectDir), 0.0), 128);
    vec3 specular = specularStrength * spec * lightColor;  

    fragColor = vec4((ambient + diffuse + specular) * objectColor, 1.0);
}
