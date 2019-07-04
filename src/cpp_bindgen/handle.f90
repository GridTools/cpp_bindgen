! GridTools
!
! Copyright (c) 2014-2019, ETH Zurich
! All rights reserved.
!
! Please, refer to the LICENSE file in the root directory.
! SPDX-License-Identifier: BSD-3-Clause

module bindgen_handle
    implicit none
    interface
        subroutine bindgen_release(h) bind(c)
            use iso_c_binding
            type(c_ptr), value :: h
        end
    end interface
end

! remove once GT is at v2.0
#ifdef CPP_BINDGEN_GT_LEGACY
module gt_handle
    implicit none
    interface
        subroutine gt_release(h) bind(c, name="bindgen_release")
            use iso_c_binding
            type(c_ptr), value :: h
        end
    end interface
end
#endif
