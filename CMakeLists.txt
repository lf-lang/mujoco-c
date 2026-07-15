cmake_minimum_required(VERSION 3.10)

project(mujoco-c)

cmake_policy(SET CMP0079 NEW)

find_package(Threads REQUIRED)

set(LF_SOURCE_DEFS TRUE)

add_compile_definitions(
    LF_FILE_SEPARATOR="/"
    LF_SOURCE_DIRECTORY="${CMAKE_SOURCE_DIR}"
    LF_SOURCE_GEN_DIRECTORY="${CMAKE_BINARY_DIR}/src-gen"
)

add_subdirectory(src-gen/centralizedRobots/CentralizedController)

if(TARGET CentralizedController)
    target_compile_definitions(CentralizedController PRIVATE
        LF_FILE_SEPARATOR="/"
        LF_SOURCE_DIRECTORY="${CMAKE_SOURCE_DIR}"
        LF_SOURCE_GEN_DIRECTORY="${CMAKE_BINARY_DIR}/src-gen"
    )
endif()