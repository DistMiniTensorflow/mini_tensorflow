cmake_minimum_required(VERSION 2.8)

project(dist_mini_tf C CXX)

add_definitions("-Wall -std=c++11 -lzmq")

set(PS_LITE_DIR "${PROJECT_SOURCE_DIR}/ps-lite")

include_directories(
	"${PS_LITE_DIR}/include"
)

add_subdirectory("ps-lite")
add_subdirectory("src")
