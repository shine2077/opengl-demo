cmake_minimum_required(VERSION 3.10)

project(opengl-demo)

add_compile_options(-Wno-dev -g)

find_package(OpenGL REQUIRED)

# configure GLFW to build only the library
set(GLFW_BUILD_EXAMPLES OFF CACHE BOOL "Build the GLFW example programs")
set(GLFW_BUILD_TESTS OFF CACHE BOOL "Build the GLFW test programs")
set(GLFW_BUILD_DOCS OFF CACHE BOOL "Build the GLFW documentation")
set(GLFW_INSTALL OFF CACHE BOOL "Generate installation target")

add_subdirectory(external/glfw)
link_libraries(glfw)
include_directories("${CMAKE_CURRENT_SOURCE_DIR}/external/glfw/deps"
                    "${CMAKE_CURRENT_SOURCE_DIR}/external/glfw/include")

set(GLAD_GL "${CMAKE_CURRENT_SOURCE_DIR}/external/glfw/deps/glad/gl.h")

add_subdirectory(external/glm)
include_directories("${CMAKE_CURRENT_SOURCE_DIR}/external/glm")

# 添加assimp库
option(ASSIMP_BUILD_ASSIMP_TOOLS OFF)
option(ASSIMP_BUILD_SAMPLES OFF)
option(ASSIMP_BUILD_TESTS OFF)
option(BUILD_SHARED_LIBS ON)
add_subdirectory(external/assimp)
include_directories("${CMAKE_CURRENT_SOURCE_DIR}/external/assimp/include")

include(cmake/imgui.cmake)

add_executable(demo demo.cpp ${GLAD_GL})
target_link_libraries(demo ${OPENGL_LIBRARIES})



