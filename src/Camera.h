#include <glm/glm.hpp>

#include <iostream>

namespace cam{

    class Camera{
        public:
            Camera(/* unsigned int shaderId, */ glm::vec3 pos);

            // void updateShader(unsigned int shaderId); 

            void updatePos(glm::vec3 pos);

            void lookAt(glm::vec3 target, glm::vec3 up);

            const glm::mat4& getView();

        private:
            glm::vec3 camPos = glm::vec3(0.0f);
            // glm::mat4 model = glm::mat4(1.0f);
             glm::mat4 view = glm::mat4(1.0f);
            // glm::mat4 projection = glm::mat4(1.0f);
            // unsigned int shaderId = 0;
    };
}; // ns cam
