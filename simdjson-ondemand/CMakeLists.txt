include(../cmake/simdjson.cmake)

file(GLOB sources *.cpp)
add_executable(simdjson-ondemand ${sources})
target_link_libraries(simdjson-ondemand simdjson drogon)
