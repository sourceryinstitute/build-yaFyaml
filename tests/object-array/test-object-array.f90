program main
   use yafyaml, only : Parser, Configuration, FileStream
   implicit none

   type vertex
     integer, allocatable :: depends_on(:)
   end type

   type dag
     type(vertex), allocatable :: vertices(:)
   end type

   type(dag) d
   type(Parser) p
   type(Configuration) c
   integer, allocatable :: nodes(:)

   p = Parser('core')
   c = p%load(FileStream('object-array.json'))

   !call c%get(d%vertices, 'dag','vertices')

   error stop "see commented call in test-object-array.f90"

   sync all
   if (this_image()==1) print *,"Test passed"
end program
