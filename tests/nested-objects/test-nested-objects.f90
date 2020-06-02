program main
   use yafyaml, only : Parser, Configuration, FileStream
   implicit none

   type dag_t
     integer :: node = -1
   end type

   type(dag_t) dag
   type(Parser) p
   type(Configuration) c

   p = Parser('core')
   c = p%load(FileStream('nested-objects.json'))
   dag%node = c%at('dag.node')

   if (dag%node /= 1) error stop "Test failed"

   sync all
   if (this_image()==1) print *,"Test passed"
end program
