set(LIBS ${pslite_LINKER_LIBS} pslite)
add_executable(dist_mini_tf main.cpp)
target_link_libraries(dist_mini_tf ${LIBS})
