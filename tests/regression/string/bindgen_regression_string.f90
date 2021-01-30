! This file is generated!
module bindgen_regression_string
use iso_c_binding
implicit none
  interface

    integer(c_int) function my_atoi_impl(arg0) bind(c, name="my_atoi")
      use iso_c_binding
      use bindgen_string_descriptor
      type(bindgen_fortran_string_descriptor) :: arg0
    end function

  end interface
contains
    integer(c_int) function my_atoi(arg0)
      use iso_c_binding
      use bindgen_string_descriptor
      character(*), target :: arg0
      type(bindgen_fortran_string_descriptor) :: descriptor0

      descriptor0%data = c_loc(arg0)
      descriptor0%size = len(arg0)

      my_atoi = my_atoi_impl(descriptor0)
    end function
end module
