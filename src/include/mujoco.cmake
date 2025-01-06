# For Mujoco
# If mujoco is installed to a different location, then the following variable
# should be set to the correct path. See README.md
set(MUJOCO_PATH "/opt/mujoco")
list(APPEND CMAKE_PREFIX_PATH ${MUJOCO_PATH})
find_library(MUJOCO_LIB mujoco REQUIRED)
find_path(MUJOCO_INCLUDE_PATH mujoco REQUIRED)
target_include_directories(${LF_MAIN_TARGET} PUBLIC ${MUJOCO_INCLUDE_PATH})
target_link_libraries(${LF_MAIN_TARGET} PUBLIC ${MUJOCO_LIB})

# For GLFW
find_package(glfw3 REQUIRED)
target_include_directories(${LF_MAIN_TARGET} PUBLIC ${glfw3_INCLUDE_DIRS})
target_link_libraries(${LF_MAIN_TARGET} PUBLIC glfw)
