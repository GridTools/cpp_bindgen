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

#include <tuple>
#include <type_traits>

namespace cpp_bindgen {
    namespace function_traits {
        namespace _impl {
            template <class>
            struct parameter_types_helper;

            template <class Ret, class... Args>
            struct parameter_types_helper<Ret(Args...)> {
                using type = std::tuple<Args...>;
            };

            template <class>
            struct result_type_helper;

            template <class Ret, class... Args>
            struct result_type_helper<Ret(Args...)> {
                using type = Ret;
            };

            template <class>
            struct arity_helper;

            template <class Ret, class... Args>
            struct arity_helper<Ret(Args...)> {
                static constexpr std::size_t value = sizeof...(Args);
            };

            template <class>
            struct nuke_fptr_helper;

            template <class Ret, class... Args>
            struct nuke_fptr_helper<Ret(Args...)> {
                using type = Ret(Args...);
            };
            template <class Ret, class... Args>
            struct nuke_fptr_helper<Ret (&)(Args...)> {
                using type = Ret(Args...);
            };
            template <class Ret, class... Args>
            struct nuke_fptr_helper<Ret (*)(Args...)> {
                using type = Ret(Args...);
            };

            template <class F>
            using nuke_fptr = typename nuke_fptr_helper<typename std::remove_cv<F>::type>::type;
        } // namespace _impl

        template <class F>
        struct parameter_types : _impl::parameter_types_helper<_impl::nuke_fptr<F>> {};

        template <class F>
        struct result_type : _impl::result_type_helper<_impl::nuke_fptr<F>> {};

        template <class F>
        struct arity : _impl::arity_helper<_impl::nuke_fptr<F>> {};

    } // namespace function_traits
} // namespace cpp_bindgen
