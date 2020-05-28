cmake_minimum_required(VERSION 3.12)

project(yaFyamlSuperbuild
  LANGUAGES Fortran
)

include(ExternalProject)
set(installDir ${CMAKE_CURRENT_BINARY_DIR}/install)

ExternalProject_Add(gFTL_shared
 SOURCE_DIR ${PROJECT_SOURCE_DIR}/git-submodules/gFTL-shared
 INSTALL_DIR ${installDir}
 CMAKE_ARGS -DCMAKE_INSTALL_PREFIX:PATH=<INSTALL_DIR>
            -DCMAKE_PREFIX_PATH:PATH=<INSTALL_DIR>
)

ExternalProject_Add(gFTL
 SOURCE_DIR ${PROJECT_SOURCE_DIR}/git-submodules/gFTL-shared/extern/gFTL
 INSTALL_DIR ${installDir}
 CMAKE_ARGS -DCMAKE_INSTALL_PREFIX:PATH=<INSTALL_DIR>
            -DCMAKE_PREFIX_PATH:PATH=<INSTALL_DIR>
)

ExternalProject_Add(yaFyaml
 SOURCE_DIR ${PROJECT_SOURCE_DIR}/git-submodules/yaFyaml
 INSTALL_DIR ${installDir}
 CMAKE_ARGS -DCMAKE_INSTALL_PREFIX:PATH=<INSTALL_DIR>
            -DCMAKE_PREFIX_PATH:PATH=<INSTALL_DIR>
 DEPENDS gFTL gFTL_shared
)

# Making the tests directory an external project ensures that it is
# configured only after the dependencies are ready.
ExternalProject_Add(tests
  SOURCE_DIR "${PROJECT_SOURCE_DIR}/tests"
  BINARY_DIR "${PROJECT_BINARY_DIR}/tests"
  DEPENDS yaFyaml
  CMAKE_ARGS -DYAFYAML_ROOT=${installDir} # YAFYAML case matches find_package call in tests
             -DCMAKE_PREFIX_PATH:PATH=${installDir}
  INSTALL_COMMAND ""
)

