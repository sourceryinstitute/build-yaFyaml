cmake_minimum_required(VERSION 3.0)
project(yaFyamlSuperbuild)

include(ExternalProject)
set(installDir ${CMAKE_CURRENT_BINARY_DIR}/install)

ExternalProject_Add(gftl-shared
 GIT_REPOSITORY https://github.com/Goddard-Fortran-Ecosystem/gftl-shared
 GIT_TAG v1.0.7
 GIT_CONFIG advice.detachedHead=false
 INSTALL_DIR ${installDir}
 CMAKE_ARGS -DCMAKE_INSTALL_PREFIX:PATH=<INSTALL_DIR>
            -DCMAKE_PREFIX_PATH:PATH=<INSTALL_DIR>
)

ExternalProject_Add(gftl
 GIT_REPOSITORY https://github.com/Goddard-Fortran-Ecosystem/gftl
 GIT_TAG v1.2.5
 GIT_CONFIG advice.detachedHead=false
 INSTALL_DIR ${installDir}
 CMAKE_ARGS -DCMAKE_INSTALL_PREFIX:PATH=<INSTALL_DIR>
            -DCMAKE_PREFIX_PATH:PATH=<INSTALL_DIR>
)

ExternalProject_Add(yaFyaml
 GIT_REPOSITORY https://github.com/Goddard-Fortran-Ecosystem/yaFyaml
 GIT_TAG v0.3.3
 GIT_CONFIG advice.detachedHead=false
 INSTALL_DIR ${installDir}
 CMAKE_ARGS -DCMAKE_INSTALL_PREFIX:PATH=<INSTALL_DIR>
            -DCMAKE_PREFIX_PATH:PATH=<INSTALL_DIR>
)

ExternalProject_Add_StepDependencies(yaFyaml configure gftl gftl-shared)
