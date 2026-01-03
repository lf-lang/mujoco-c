# For MuJoCo
if(APPLE)
    # Prefer the MuJoCo.app bundle when installed via the official DMG.
    set(MUJOCO_APP_PATH "/Applications/MuJoCo.app/Contents" CACHE PATH "MuJoCo.app Contents path")
    set(MUJOCO_FRAMEWORK_DIR "${MUJOCO_APP_PATH}/Frameworks")

    if(EXISTS "${MUJOCO_FRAMEWORK_DIR}/mujoco.framework")
        # Check if framework has proper structure (binary symlink at root)
        if(EXISTS "${MUJOCO_FRAMEWORK_DIR}/mujoco.framework/mujoco")
            # Standard framework structure - let CMake handle it
            list(APPEND CMAKE_FRAMEWORK_PATH "${MUJOCO_FRAMEWORK_DIR}")
            find_library(MUJOCO_LIB
                NAMES mujoco
                REQUIRED
            )
            set(MUJOCO_INCLUDE_PATH "${MUJOCO_LIB}/Headers")
        else()
            # Non-standard framework structure - find the dylib directly
            file(GLOB MUJOCO_DYLIB_CANDIDATES
                "${MUJOCO_FRAMEWORK_DIR}/mujoco.framework/Versions/*/libmujoco*.dylib"
            )
            if(MUJOCO_DYLIB_CANDIDATES)
                list(GET MUJOCO_DYLIB_CANDIDATES 0 MUJOCO_LIB)
                message(STATUS "Found MuJoCo library (non-standard framework): ${MUJOCO_LIB}")
            else()
                message(FATAL_ERROR "Could not find MuJoCo library in ${MUJOCO_FRAMEWORK_DIR}/mujoco.framework")
            endif()

            # Create a local include directory structure to handle mujoco/ prefix includes
            set(MUJOCO_LOCAL_INCLUDE "${CMAKE_BINARY_DIR}/mujoco_include")
            set(MUJOCO_HEADERS_LINK "${MUJOCO_LOCAL_INCLUDE}/mujoco")

            # Create the directory and symlink if they don't exist
            file(MAKE_DIRECTORY "${MUJOCO_LOCAL_INCLUDE}")
            if(NOT EXISTS "${MUJOCO_HEADERS_LINK}")
                execute_process(
                    COMMAND ${CMAKE_COMMAND} -E create_symlink
                    "${MUJOCO_FRAMEWORK_DIR}/mujoco.framework/Headers"
                    "${MUJOCO_HEADERS_LINK}"
                )
            endif()

            set(MUJOCO_INCLUDE_PATH "${MUJOCO_LOCAL_INCLUDE}")
        endif()
    else()
        # Fallback to the /opt style installation that we document in README.md.
        set(MUJOCO_PATH "/opt/mujoco" CACHE PATH "MuJoCo base directory")
        list(APPEND CMAKE_PREFIX_PATH "${MUJOCO_PATH}")

        find_library(MUJOCO_LIB
            NAMES mujoco
            PATHS "${MUJOCO_PATH}" "${MUJOCO_PATH}/lib"
            REQUIRED
        )

        find_path(MUJOCO_INCLUDE_PATH
            NAMES mujoco/mujoco.h
            PATHS "${MUJOCO_PATH}" "${MUJOCO_PATH}/include"
            REQUIRED
        )
    endif()
else()
    # Original Linux-style install
    set(MUJOCO_PATH "/opt/mujoco" CACHE PATH "MuJoCo base directory")
    list(APPEND CMAKE_PREFIX_PATH "${MUJOCO_PATH}")

    find_library(MUJOCO_LIB
        NAMES mujoco
        PATHS "${MUJOCO_PATH}" "${MUJOCO_PATH}/lib"
        REQUIRED
    )

    find_path(MUJOCO_INCLUDE_PATH
        NAMES mujoco/mujoco.h
        PATHS "${MUJOCO_PATH}" "${MUJOCO_PATH}/include"
        REQUIRED
    )
endif()

target_include_directories(${LF_MAIN_TARGET} PUBLIC "${MUJOCO_INCLUDE_PATH}")
target_link_libraries(${LF_MAIN_TARGET} PUBLIC "${MUJOCO_LIB}")

# For GLFW (installed via Homebrew)

if(APPLE)
    # Adjust this if you're on Intel macOS (see comment below)
    set(HOMEBREW_PREFIX "/opt/homebrew" CACHE PATH "Homebrew prefix")
else()
    set(HOMEBREW_PREFIX "/usr/local" CACHE PATH "Homebrew prefix")
endif()

# Look for the header
find_path(GLFW_INCLUDE_DIR
    NAMES GLFW/glfw3.h
    PATHS
        "${HOMEBREW_PREFIX}/include"
        "/usr/local/include"
    REQUIRED
)

# Look for the library
find_library(GLFW_LIB
    NAMES glfw
    PATHS
        "${HOMEBREW_PREFIX}/lib"
        "/usr/local/lib"
    REQUIRED
)

target_include_directories(${LF_MAIN_TARGET} PUBLIC "${GLFW_INCLUDE_DIR}")
target_link_libraries(${LF_MAIN_TARGET} PUBLIC "${GLFW_LIB}")
