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

#include <stdbool.h>

enum bindgen_fortran_array_kind {
    bindgen_fk_Bool,
    bindgen_fk_Int,
    bindgen_fk_Short,
    bindgen_fk_Long,
    bindgen_fk_LongLong,
    bindgen_fk_Float,
    bindgen_fk_Double,
    bindgen_fk_LongDouble,
    bindgen_fk_SignedChar,
};
typedef enum bindgen_fortran_array_kind bindgen_fortran_array_kind;

struct bindgen_fortran_array_descriptor {
    bindgen_fortran_array_kind type;
    int rank;
    int dims[7];
    void *data;
    bool is_acc_present;
    // TODO: add support for strides, bounds end type bindgen_fortran_array_descriptor
};
typedef struct bindgen_fortran_array_descriptor bindgen_fortran_array_descriptor;
