add_executable (test-json-input test-json-input.f90)

target_link_libraries (test-json-input
  PRIVATE yafyaml
)

target_include_directories(test-json-input
  PRIVATE $<TARGET_PROPERTY:YAFYAML,Fortran_MODULE_DIRECTORY>
)

file(COPY input.json DESTINATION ${CMAKE_CURRENT_BINARY_DIR})
