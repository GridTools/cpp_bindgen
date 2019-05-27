/*
 * GridTools
 *
 * Copyright (c) 2014-2019, ETH Zurich
 * All rights reserved.
 *
 * Please, refer to the LICENSE file in the root directory.
 * SPDX-License-Identifier: BSD-3-Clause
 */

#include <cpp_bindgen/common/copy_into_variadic.hpp>

#include <type_traits>

#include <boost/mpl/vector.hpp>
#include <gtest/gtest.h>

namespace cpp_bindgen {
    namespace {
        template <class...>
        struct dst;
        template <class... Ts>
        using src = boost::mpl::vector<Ts...>;

        static_assert(std::is_same<copy_into_variadic<src<>, dst<>>, dst<>>{}, "empty into empty");
        static_assert(
            std::is_same<copy_into_variadic<src<int, void>, dst<>>, dst<int, void>>{}, "non empty into empty");
        static_assert(
            std::is_same<copy_into_variadic<src<>, dst<int, void>>, dst<int, void>>{}, "empty into non empty");
        static_assert(
            std::is_same<copy_into_variadic<src<void>, dst<int>>, dst<int, void>>{}, "non empty into non empty");
    } // namespace
} // namespace cpp_bindgen

TEST(dummy, dummy) {}
