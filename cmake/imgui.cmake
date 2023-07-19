include_directories(${CMAKE_CURRENT_SOURCE_DIR}/external/imgui
                    ${CMAKE_CURRENT_SOURCE_DIR}/external/imgui/backends)

# set common source
file(GLOB IMGUI_SOURCES
    ./imgui/*.h
    ./imgui/*.cpp
)

file (GLOB IMGUI_BACKEND_SOURCES
        "${CMAKE_CURRENT_SOURCE_DIR}/external/imgui/backends/imgui_impl_glfw.cpp"
        "${CMAKE_CURRENT_SOURCE_DIR}/external/imgui/backends/imgui_impl_opengl3.cpp")

add_library (imgui ${IMGUI_SOURCES} ${IMGUI_BACKEND_SOURCES})