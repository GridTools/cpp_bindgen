/*
 * GridTools
 *
 * Copyright (c) 2014-2019, ETH Zurich
 * All rights reserved.
 *
 * Please, refer to the LICENSE file in the root directory.
 * SPDX-License-Identifier: BSD-3-Clause
 */

#include <cstdlib>
#include <string>

#include <cpp_bindgen/export.hpp>

int atoi_impl(std::string const& src) { return atoi(src.c_str()); }

BINDGEN_EXPORT_BINDING_WRAPPED_1(my_atoi, atoi_impl);
