/*
 * GridTools
 *
 * Copyright (c) 2014-2019, ETH Zurich
 * All rights reserved.
 *
 * Please, refer to the LICENSE file in the root directory.
 * SPDX-License-Identifier: BSD-3-Clause
 */
#include "implementation.cpp"

namespace gpu_array {
    template <class T>
    struct my_array {
        using data_t = T;

        T *data;
        int sizes[3];
        int strides[3];

        __device__ const T &operator()(int i, int j, int k) const {
            assert(i < sizes[0] && j < sizes[1] && k < sizes[2] && "out of bounds");
            return data[i * strides[0] + j * strides[1] + k * strides[2]];
        }

        __device__ T &operator()(int i, int j, int k) {
            assert(i < sizes[0] && j < sizes[1] && k < sizes[2] && "out of bounds");
            return data[i * strides[0] + j * strides[1] + k * strides[2]];
        }
    };

    template <typename T>
    my_array<T> gen_make_fortran_array_view(gen_fortran_array_descriptor *descriptor, my_array<T> *) {
        if (descriptor->rank != 3) {
            throw std::runtime_error("only 3-dimensional arrays are supported");
        }
        return my_array<T>{static_cast<T *>(descriptor->data),
            {descriptor->dims[0], descriptor->dims[1], descriptor->dims[2]},
            {1, descriptor->dims[0], descriptor->dims[0] * descriptor->dims[1]}};
    }

    template <typename T>
    gen_fortran_array_descriptor get_fortran_view_meta(my_array<T> *) {
        gen_fortran_array_descriptor descriptor;
        descriptor.type = cpp_bindgen::fortran_array_element_kind<T>::value;
        descriptor.rank = 3;
        descriptor.is_acc_present = true;
        return descriptor;
    }

    static_assert(cpp_bindgen::is_fortran_array_bindable<my_array<double>>::value, "");
    static_assert(cpp_bindgen::is_fortran_array_wrappable<my_array<double>>::value, "");
} // namespace gpu_array

namespace {
    __global__ void fill_array_kernel(gpu_array::my_array<double> a) {
        for (size_t i = 0; i < a.sizes[0]; ++i) {
            a(i, blockIdx.x, threadIdx.x) = i * 10000 + blockIdx.x * 100 + threadIdx.x;
        }
    }

    void fill_gpu_array_impl(gpu_array::my_array<double> a) { fill_array_kernel<<<a.sizes[1], a.sizes[0]>>>(a); }

    GEN_EXPORT_BINDING_WRAPPED_1(fill_gpu_array, fill_gpu_array_impl);
} // namespace
