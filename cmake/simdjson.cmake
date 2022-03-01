# Retrieve simdjson
include(FetchContent)
FetchContent_Declare(
  simdjson
  GIT_REPOSITORY https://github.com/simdjson/simdjson.git
  GIT_TAG  tags/v1.0.2
  GIT_SHALLOW TRUE)
FetchContent_MakeAvailable(simdjson)
