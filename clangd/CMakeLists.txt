## CMakeLists Template
cmake_minimum_required(VERSION 3.25)
project(RENAME_ME)

set(CMAKE_CXX_STANDARD 26)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)  # auto-generates compile_commands.json

file(GLOB_RECURSE SOURCES CONFIGURE_DEPENDS *.cpp)
add_executable(${PROJECT_NAME} ${SOURCES})

# Add Library Example:
# To add mpfr:
# target_link_libraries(${PROJECT_NAME} PUBLIC mpfr)
