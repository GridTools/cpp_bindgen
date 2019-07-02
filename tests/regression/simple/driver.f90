! GridTools
!
! Copyright (c) 2014-2019, ETH Zurich
! All rights reserved.
!
! Please, refer to the LICENSE file in the root directory.
! SPDX-License-Identifier: BSD-3-Clause

program main
    use iso_c_binding
    use bindgen_handle
    use bindgen_regression_simple
    implicit none
    integer, parameter :: i = 9

    call print_number_from_cpp(i)

end
