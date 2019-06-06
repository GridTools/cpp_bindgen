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

    /**
     * @file
     * Some c++14/c++17 type_traits drop offs. Please refer to C++14/17 specifications
     * to know more about them.
     */

    template <bool V>
    using bool_constant = std::integral_constant<bool, V>;

    template <class T>
    using remove_reference_t = typename std::remove_reference<T>::type;
    template <class T>
    using remove_pointer_t = typename std::remove_pointer<T>::type;
    template <class T>
    using add_pointer_t = typename std::add_pointer<T>::type;
    template <class T>
    using remove_all_extents_t = typename std::remove_all_extents<T>::type;
    template <class T>
    using decay_t = typename std::decay<T>::type;
    template <bool V, class T = void>
    using enable_if_t = typename std::enable_if<V, T>::type;

    template <typename... Ts>
    struct make_void {
        typedef void type;
    };
    template <typename... Ts>
    using void_t = typename make_void<Ts...>::type;
} // namespace cpp_bindgen
