! GridTools
!
! Copyright (c) 2014-2019, ETH Zurich
! All rights reserved.
!
! Please, refer to the LICENSE file in the root directory.
! SPDX-License-Identifier: BSD-3-Clause

program main
    use iso_c_binding
    use gt_handle
    use bindgen_regression_array_gt_legacy
    implicit none
    integer, parameter :: ie = 9, je = 10, ke = 11
    integer :: i, j, k
    real(8), dimension(ie, je, ke) :: arr, expected

    call fill_array(arr)

    DO i=1, ie
        DO j=1, je
            DO k=1, ke
                expected(i,j,k) = (i-1)*10000 + (j-1)*100 + (k-1)
            END DO
        END DO
    END DO

    if (any(arr /= expected)) stop 1
end
