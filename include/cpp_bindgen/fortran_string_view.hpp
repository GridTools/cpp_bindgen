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

#include "string_descriptor.h"

bindgen_fortran_string_descriptor
inline bindgen_make_fortran_string_view(bindgen_fortran_string_descriptor desc, bindgen_fortran_string_descriptor*) {
    return desc;
}

#include <string>

namespace std {
    inline string bindgen_make_fortran_string_view(bindgen_fortran_string_descriptor desc, string*) {
        return {desc.data, (size_t)desc.size};
    }
}

#if __cplusplus >= 201703L
#include <string_view>

namespace std {
    inline string_view bindgen_make_fortran_string_view(bindgen_fortran_string_descriptor desc, string_view*) {
        return {desc.data, (size_t)desc.size};
    }
}
#endif

namespace cpp_bindgen {
    namespace fortran_string_view_impl_ {

        template <class T>
        auto make_fortran_string_view(bindgen_fortran_string_descriptor desc) ->
            decltype(bindgen_make_fortran_string_view(desc, (T*)0)) {
            return bindgen_make_fortran_string_view(desc, (T*)0);
        }

        template <class T, class = void>
        struct is_fortran_string_bindable : std::false_type {};

        template <class T>
        struct is_fortran_string_bindable<
            T,
            typename std::enable_if<
                std::is_convertible<
                    decltype(make_fortran_string_view<typename std::decay<T>::type>(
                        std::declval<bindgen_fortran_string_descriptor>())), T>::value>::type> : std::true_type {};
    }
    using fortran_string_view_impl_::make_fortran_string_view;
    using fortran_string_view_impl_::is_fortran_string_bindable;
}
