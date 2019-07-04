/*
 * GridTools
 *
 * Copyright (c) 2014-2019, ETH Zurich
 * All rights reserved.
 *
 * Please, refer to the LICENSE file in the root directory.
 * SPDX-License-Identifier: BSD-3-Clause
 */
#pragma once

struct bindgen_handle;

#ifdef __cplusplus

extern "C" void bindgen_release(bindgen_handle const *);
#ifdef CPP_BINDGEN_GT_LEGACY // remove once GT is at v2.0
extern "C" void gt_release(bindgen_handle const *);
#endif

#else

typedef struct bindgen_handle bindgen_handle;
void bindgen_release(bindgen_handle *);
#ifdef CPP_BINDGEN_GT_LEGACY // remove once GT is at v2.0
typedef struct bindgen_handle gt_handle;
void gt_release(bindgen_handle *);
#endif

#endif
