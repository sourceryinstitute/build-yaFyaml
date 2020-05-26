cmake_minimum_required(VERSION 3.12)

project(yaFyaml_tests
  LANGUAGES Fortran
)

find_package (GFTL REQUIRED)
find_package (GFTL_SHARED REQUIRED VERSION 1.0.4)
find_package(YAFYAML REQUIRED)

if(CMAKE_Fortran_COMPILER_ID MATCHES GNU)
  set(CMAKE_Fortran_FLAGS "${CMAKE_Fortran_FLAGS} -Wall -std=f2018")
  get_filename_component(barename ${CMAKE_Fortran_COMPILER} NAME)
  if("${barename}" MATCHES gfortran)
    set(CMAKE_Fortran_FLAGS "${CMAKE_Fortran_FLAGS} -fcoarray=single")
  endif()
endif()

set(CMAKE_Fortran_MODULE_DIRECTORY "${PROJECT_BINARY_DIR}/mod")

enable_testing()

add_subdirectory(json-input)

function(add_caf_test name num_images)
  set(test_dir "${name}")
  add_test(NAME "${name}"
    COMMAND cafrun -n "${num_images}" "$<TARGET_FILE:test-${name}>"
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
