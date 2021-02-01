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

#include <stddef.h>

struct bindgen_fortran_string_descriptor {
    char *data;
    ptrdiff_t size;
};
typedef struct bindgen_fortran_string_descriptor bindgen_fortran_string_descriptor;
