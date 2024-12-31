# For Mujoco
list(APPEND CMAKE_PREFIX_PATH "/usr/local/")
find_package(mujoco REQUIRED)
target_include_directories(${LF_MAIN_TARGET} PUBLIC /usr/local/include)
target_link_libraries(${LF_MAIN_TARGET} PUBLIC mujoco::mujoco)

# For GLFW
list(APPEND CMAKE_PREFIX_PATH "/opt/homebrew/")
find_package(glfw3 3.4 REQUIRED)
target_include_directories(${LF_MAIN_TARGET} PUBLIC /opt/homebrew/include)
target_link_libraries(${LF_MAIN_TARGET} PUBLIC glfw)
