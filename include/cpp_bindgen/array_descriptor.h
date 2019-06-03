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

enum gen_fortran_array_kind {
    gen_fk_Bool,
    gen_fk_Int,
    gen_fk_Short,
    gen_fk_Long,
    gen_fk_LongLong,
    gen_fk_Float,
    gen_fk_Double,
    gen_fk_LongDouble,
    gen_fk_SignedChar,

#ifdef CPP_BINDGEN_GT_LEGACY // remove once GT is at v2.0
    gt_fk_Bool = gen_fk_Bool,
    gt_fk_Int = gen_fk_Int,
    gt_fk_Short = gen_fk_Int,
    gt_fk_Long = gen_fk_Long,
    gt_fk_LongLong = gen_fk_LongLong,
    gt_fk_Float = gen_fk_Float,
    gt_fk_Double = gen_fk_Double,
    gt_fk_LongDouble = gen_fk_LongDouble,
    gt_fk_SignedChar = gen_fk_SignedChar
#endif
};
typedef enum gen_fortran_array_kind gen_fortran_array_kind;

struct gen_fortran_array_descriptor {
    gen_fortran_array_kind type;
    int rank;
    int dims[7];
    void *data;
    bool is_acc_present;
    // TODO: add support for strides, bounds end type gen_fortran_array_descriptor
};
typedef struct gen_fortran_array_descriptor gen_fortran_array_descriptor;

#ifdef CPP_BINDGEN_GT_LEGACY // remove once GT is at v2.0
typedef struct gen_fortran_array_descriptor gt_fortran_array_descriptor;
#endif
