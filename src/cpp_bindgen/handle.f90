! GridTools
!
! Copyright (c) 2014-2019, ETH Zurich
! All rights reserved.
!
! Please, refer to the LICENSE file in the root directory.
! SPDX-License-Identifier: BSD-3-Clause

module gen_handle
    implicit none
    interface
        subroutine gen_release(h) bind(c)
            use iso_c_binding
            type(c_ptr), value :: h
        end
    end interface
end
