program main
   use yafyaml, only : Parser, Configuration, FileStream
   implicit none

   type vertex_t
     integer :: id = -1
   end type

   type dag_t
     type(vertex_t) vertex
   end type

   type(dag_t) dag
   type(Parser) p
   type(Configuration) c

   p = Parser('core')
   c = p%load(FileStream('nested-objects.json'))
   dag%vertex%id = c%at('dag', 'vertex', 'id')

   if (dag%vertex%id /= 1) error stop "Test failed"

   sync all
   if (this_image()==1) print *,"Test passed"
end program
