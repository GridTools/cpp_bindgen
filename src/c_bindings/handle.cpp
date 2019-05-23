/*
 * GridTools
 *
 * Copyright (c) 2014-2019, ETH Zurich
 * All rights reserved.
 *
 * Please, refer to the LICENSE file in the root directory.
 * SPDX-License-Identifier: BSD-3-Clause
 */

#include <c_bindings/handle.h>
#include <c_bindings/handle_impl.hpp>

void gt_release(gt_handle const *obj) { delete obj; }
