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

#else

typedef struct bindgen_handle bindgen_handle;
void bindgen_release(bindgen_handle *);

#endif
