cmake_minimum_required(VERSION 3.22)

project(
  json-web-benchmark
  VERSION 0.1
  DESCRIPTION "JSON web server benchmarks"
  LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 17)

include(cmake/default-release.cmake)
include(cmake/drogon.cmake)
add_subdirectory(simdjson-ondemand)
