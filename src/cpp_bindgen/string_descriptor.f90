! GridTools
!
! Copyright (c) 2014-2019, ETH Zurich
! All rights reserved.
!
! Please, refer to the LICENSE file in the root directory.
! SPDX-License-Identifier: BSD-3-Clause

module bindgen_string_descriptor
    use iso_c_binding
    implicit none

    type, bind(c), public :: bindgen_fortran_string_descriptor
        type(c_ptr) :: data
        integer(c_ptrdiff_t) :: size
    end type bindgen_fortran_string_descriptor
end module
