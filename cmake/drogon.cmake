include(FetchContent)
set(DROGON_VERSION 1.7.4)
FetchContent_Declare(
    drogon
    GIT_REPOSITORY https://github.com/drogonframework/drogon
    GIT_TAG tags/v${DROGON_VERSION}
)
FetchContent_MakeAvailable(drogon)
