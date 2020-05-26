cmake_minimum_required(VERSION 3.17)

project(yaFyamlSuperbuild
  LANGUAGES Fortran
)

include(ExternalProject)
set(installDir ${CMAKE_CURRENT_BINARY_DIR}/install)

ExternalProject_Add(GFTL_SHARED
 SOURCE_DIR ${PROJECT_SOURCE_DIR}/git-submodules/gftl-shared
 INSTALL_DIR ${installDir}
 CMAKE_ARGS -DCMAKE_INSTALL_PREFIX:PATH=<INSTALL_DIR>
            -DCMAKE_PREFIX_PATH:PATH=<INSTALL_DIR>
)
find_package(GFTL_SHARED
  HINTS "$<TARGET_PROPERTY:GFTL_SHARED,CMAKE_PREFIX_PATH>/cmake"
)


ExternalProject_Add(GFTL
 SOURCE_DIR ${PROJECT_SOURCE_DIR}/git-submodules/gftl
 INSTALL_DIR ${installDir}
 CMAKE_ARGS -DCMAKE_INSTALL_PREFIX:PATH=<INSTALL_DIR>
            -DCMAKE_PREFIX_PATH:PATH=<INSTALL_DIR>
)
find_package(GFTL
  HINTS "$<TARGET_PROPERTY:GFTL,CMAKE_PREFIX_PATH>/cmake"
)

ExternalProject_Add(YAFYAML
 SOURCE_DIR ${PROJECT_SOURCE_DIR}/git-submodules/yaFyaml
 INSTALL_DIR ${installDir}
 CMAKE_ARGS -DCMAKE_INSTALL_PREFIX:PATH=<INSTALL_DIR>
            -DCMAKE_PREFIX_PATH:PATH=<INSTALL_DIR>
)
find_package(YAFYAML
  HINTS "$<$<TARGET_PROPERTY:YAFYAML,CMAKE_INSTALL_PREFIX>/install/YAFYAML-${YAFYAML_VERSION_MAJOR}.${YAFYAML_VERSION_MINOR}>/cmake"
  PATHS "$<$<TARGET_PROPERTY:YAFYAML,CMAKE_INSTALL_PREFIX>/install/YAFYAML-${YAFYAML_VERSION_MAJOR}.${YAFYAML_VERSION_MINOR}>/cmake"
)

ExternalProject_Add_StepDependencies(YAFYAML configure GFTL GFTL_SHARED)



if(CMAKE_Fortran_COMPILER_ID MATCHES GNU)
  set(CMAKE_Fortran_FLAGS "${CMAKE_Fortran_FLAGS} -Wall -std=f2018")
  get_filename_component(barename ${CMAKE_Fortran_COMPILER} NAME)
  if("${barename}" MATCHES gfortran)
    set(CMAKE_Fortran_FLAGS "${CMAKE_Fortran_FLAGS} -fcoarray=single")
  endif()
endif()

set(CMAKE_Fortran_MODULE_DIRECTORY "${PROJECT_BINARY_DIR}/mod")

enable_testing()

add_subdirectory("tests")

function(add_caf_test name num_images)
  set(test_dir "${PROJECT_BINARY_DIR}/tests/${name}")
  add_test(NAME "${name}"
    COMMAND cafrun -n "${num_images}" "${test_dir}/test-${name}"
    WORKING_DIRECTORY "${test_dir}"
  )
  set_tests_properties(${name}
     PROPERTIES PASS_REGULAR_EXPRESSION "Test passed."
  )
endfunction()

foreach(test_name
  json-input
)
  add_caf_test("${test_name}" 2)
endforeach()
