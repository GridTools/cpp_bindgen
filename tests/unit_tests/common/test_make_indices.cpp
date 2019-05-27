/*
 * GridTools
 *
 * Copyright (c) 2014-2019, ETH Zurich
 * All rights reserved.
 *
 * Please, refer to the LICENSE file in the root directory.
 * SPDX-License-Identifier: BSD-3-Clause
 */
#include <cpp_bindgen/common/make_indices.hpp>

#include <gtest/gtest.h>

using namespace cpp_bindgen;

static_assert(std::is_same<integer_sequence<int>::value_type, int>::value, "");
static_assert(integer_sequence<int, 1, 2, 3>::size() == 3, "");

static_assert(std::is_same<make_integer_sequence<int, 3>, integer_sequence<int, 0, 1, 2>>::value, "");

static_assert(std::is_same<typename make_indices_c<2>::type,
                  list<std::integral_constant<std::size_t, 0>, std::integral_constant<std::size_t, 1>>>::value,
    "");

TEST(make_indices, make_indices) {}
