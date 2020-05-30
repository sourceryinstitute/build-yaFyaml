add_executable (test-object-array test-object-array.f90)

target_link_libraries (test-object-array
  PRIVATE yafyaml
)

file(COPY object-array.json DESTINATION ${CMAKE_CURRENT_BINARY_DIR})
