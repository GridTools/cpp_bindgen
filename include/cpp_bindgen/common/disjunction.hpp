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

#include <type_traits>

namespace cpp_bindgen {

    template <class...>
    struct disjunction : std::false_type {};
    template <class B1>
    struct disjunction<B1> : B1 {};
    template <class B1, class... Bn>
    struct disjunction<B1, Bn...> : std::conditional<bool(B1::value), B1, disjunction<Bn...>>::type {};
} // namespace cpp_bindgen
