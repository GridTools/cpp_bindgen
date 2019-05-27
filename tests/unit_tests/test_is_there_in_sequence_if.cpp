/*
 * GridTools
 *
 * Copyright (c) 2014-2019, ETH Zurich
 * All rights reserved.
 *
 * Please, refer to the LICENSE file in the root directory.
 * SPDX-License-Identifier: BSD-3-Clause
 */
#include <common/is_there_in_sequence_if.hpp>

#include <type_traits>

#include <boost/mpl/vector.hpp>

#include <gtest/gtest.h>

using namespace cpp_bindgen;

TEST(is_there_in_sequence_if, is_there_in_sequence_if) {
    typedef boost::mpl::vector<int, float, char> seq_t;

    static_assert(is_there_in_sequence_if<seq_t, std::is_same<boost::mpl::_, char>>::value, "ERROR");
    static_assert(is_there_in_sequence_if<seq_t, std::is_same<boost::mpl::_, int>>::value, "ERROR");
    static_assert(!is_there_in_sequence_if<seq_t, std::is_same<boost::mpl::_, long>>::value, "ERROR");
}
