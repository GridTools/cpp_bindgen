/*
 * GridTools
 *
 * Copyright (c) 2014-2019, ETH Zurich
 * All rights reserved.
 *
 * Please, refer to the LICENSE file in the root directory.
 * SPDX-License-Identifier: BSD-3-Clause
 */

#include <cpp_bindgen/handle.h>
#include <cpp_bindgen/handle_impl.hpp>

void bindgen_release(bindgen_handle const *obj) { delete obj; }

#ifdef CPP_BINDGEN_GT_LEGACY // remove once GT is at v2.0
void gt_release(bindgen_handle const *obj) { bindgen_release(obj); }
#endif
