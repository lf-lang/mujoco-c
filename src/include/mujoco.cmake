if(CMAKE_SYSTEM_NAME MATCHES "Linux")
  set(MUJOCO_PATH /opt/mujoco-3.2.6-linux-x86_64/mujoco-3.2.6/)
elseif (CMAKE_SYSTEM_NAME MATCHES "Darwin")
  set(MUJOCO_PATH /Application/MuJoCo.app/mujoco.framework)
endif()

# For Mujoco
list(APPEND CMAKE_PREFIX_PATH ${MUJOCO_PATH})
find_library(MUJOCO_LIB mujoco REQUIRED)
find_path(MUJOCO_INCLUDE_PATH mujoco REQUIRED)
target_include_directories(${LF_MAIN_TARGET} PUBLIC ${MUJOCO_INCLUDE_PATH})
target_link_libraries(${LF_MAIN_TARGET} PUBLIC ${MUJOCO_LIB})

# For GLFW
find_package(glfw3 REQUIRED)
target_include_directories(${LF_MAIN_TARGET} PUBLIC ${glfw3_INCLUDE_DIRS})
target_link_libraries(${LF_MAIN_TARGET} PUBLIC glfw)
