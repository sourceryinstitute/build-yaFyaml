add_executable (test-nested-objects test-nested-objects.f90)

target_link_libraries (test-nested-objects
  PRIVATE yafyaml
)

file(COPY nested-objects.json DESTINATION ${CMAKE_CURRENT_BINARY_DIR})
