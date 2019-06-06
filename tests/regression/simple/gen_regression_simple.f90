! This file is generated!
module gen_regression_simple
implicit none
  interface

    subroutine print_number_from_cpp(arg0) bind(c)
      use iso_c_binding
      integer(c_int), value :: arg0
    end subroutine

  end interface
contains
end
