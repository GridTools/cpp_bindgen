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

#include <cstddef>
#include <type_traits>

namespace cpp_bindgen {
    /**
     *   The default list constructor.
     *
     *   Used within the library when it needed to produce something, that satisfy list concept.
     */
    template <class...>
    struct list {
        using type = list;
    };

    template <typename Int, Int... Indices>
    struct integer_sequence {
        using value_type = Int;
        static constexpr std::size_t size() noexcept { return sizeof...(Indices); }
    };

    namespace make_indices_impl_ {
        template <typename Seq, std::size_t Size, size_t Rem>
        struct expand_integer_sequence;

        template <typename Int, Int... Is, std::size_t Size>
        struct expand_integer_sequence<integer_sequence<Int, Is...>, Size, 0> {
            using type = integer_sequence<Int, Is..., (Size + Is)...>;
        };

        template <typename Int, Int... Is, std::size_t Size>
        struct expand_integer_sequence<integer_sequence<Int, Is...>, Size, 1> {
            using type = integer_sequence<Int, Is..., (Size + Is)..., 2 * Size>;
        };

        template <typename Int, std::size_t N>
        struct generate_integer_sequence {
            using type = typename expand_integer_sequence<typename generate_integer_sequence<Int, N / 2>::type,
                N / 2,
                N % 2>::type;
        };

        template <typename Int>
        struct generate_integer_sequence<Int, 0> {
            using type = integer_sequence<Int>;
        };
    } // namespace make_indices_impl_

    template <typename Int, Int N>
    using make_integer_sequence = typename make_indices_impl_::generate_integer_sequence<Int, N>::type;

    template <std::size_t... Indices>
    using index_sequence = integer_sequence<std::size_t, Indices...>;

    template <std::size_t N>
    using make_index_sequence = make_integer_sequence<std::size_t, N>;

    /**
     *  Convert an integer sequence to a list of corresponding integral constants.
     */
    template <class, template <class...> class = list>
    struct iseq_to_list;
    template <template <class T, T...> class ISec, class Int, Int... Is, template <class...> class L>
    struct iseq_to_list<ISec<Int, Is...>, L> {
        using type = L<std::integral_constant<Int, Is>...>;
    };

    /**
     *  Make a list of integral constants of indices from 0 to N
     */
    template <std::size_t N, template <class...> class L = list>
    struct make_indices_c : iseq_to_list<make_index_sequence<N>, L>::type {};

} // namespace cpp_bindgen
