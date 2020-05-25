cmake_minimum_required(VERSION 3.0)
project(yaFyamlSuperbuild)

include(ExternalProject)
set(installDir ${CMAKE_CURRENT_BINARY_DIR}/install)

ExternalProject_Add(gftl-shared
 SOURCE_DIR ${PROJECT_SOURCE_DIR}/git-submodules/gftl-shared
 INSTALL_DIR ${installDir}
 CMAKE_ARGS -DCMAKE_INSTALL_PREFIX:PATH=<INSTALL_DIR>
            -DCMAKE_PREFIX_PATH:PATH=<INSTALL_DIR>
)

ExternalProject_Add(gftl
 SOURCE_DIR ${PROJECT_SOURCE_DIR}/git-submodules/gftl
 INSTALL_DIR ${installDir}
 CMAKE_ARGS -DCMAKE_INSTALL_PREFIX:PATH=<INSTALL_DIR>
            -DCMAKE_PREFIX_PATH:PATH=<INSTALL_DIR>
)

ExternalProject_Add(yaFyaml
 SOURCE_DIR ${PROJECT_SOURCE_DIR}/git-submodules/yaFyaml
 INSTALL_DIR ${installDir}
 CMAKE_ARGS -DCMAKE_INSTALL_PREFIX:PATH=<INSTALL_DIR>
            -DCMAKE_PREFIX_PATH:PATH=<INSTALL_DIR>
)

ExternalProject_Add_StepDependencies(yaFyaml configure gftl gftl-shared)
