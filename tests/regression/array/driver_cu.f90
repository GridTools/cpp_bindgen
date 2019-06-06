! GridTools
!
! Copyright (c) 2014-2019, ETH Zurich
! All rights reserved.
!
! Please, refer to the LICENSE file in the root directory.
! SPDX-License-Identifier: BSD-3-Clause

program main
    use iso_c_binding
    use gen_handle
    use gen_regression_array_cu
    implicit none
    integer, parameter :: ie = 9, je = 10, ke = 11
    integer :: i, j, k
    real(8), dimension(ie, je, ke) :: arr, expected

    !$acc enter data create(arr)

    call fill_gpu_array(arr)

    !$acc exit data copyout(arr)

    call fill_array(arr)

    do i=1, ie
        do j=1, je
            do k=1, ke
                expected(i,j,k) = (i-1)*10000 + (j-1)*100 + (k-1)
                end do
            end do
    end do

    if (any(arr /= expected)) stop 1

    print *, "Success!"
end
