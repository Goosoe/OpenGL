#include "Camera.h"
#include "glm/gtc/matrix_transform.hpp"

namespace cam{

    Camera::Camera(/* unsigned int shaderId, */ glm::vec3 pos){
        this->camPos = pos;
//        updateShader(shaderId);
    }

    // void Camera::updateShader(unsigned int shaderId){
    //     this->shaderId = shaderId;
    // }

    void Camera::updatePos(glm::vec3 pos){
        camPos = pos;
    }

    void Camera::lookAt(glm::vec3 target, glm::vec3 up){
        // view = glm::lookAt(glm::vec3(camPos.x, 0.0f, camPos.z), target, up);
        view = glm::lookAt(glm::vec3(camPos.x, 0.0f, camPos.z), target, up);
    }

    const glm::mat4& Camera::getView(){
        return view;
    }
}; //ns cam
