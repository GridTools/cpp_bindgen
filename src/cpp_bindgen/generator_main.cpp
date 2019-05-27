/*
 * GridTools
 *
 * Copyright (c) 2014-2019, ETH Zurich
 * All rights reserved.
 *
 * Please, refer to the LICENSE file in the root directory.
 * SPDX-License-Identifier: BSD-3-Clause
 */

#include <fstream>
#include <iostream>

#include <cpp_bindgen/generator.hpp>

int main(int argc, const char *argv[]) {
    if (argc > 3) {
        std::ofstream dst(argv[2]);
        cpp_bindgen::generate_fortran_interface(dst, argv[3]);
    }
    if (argc > 1) {
        std::ofstream dst(argv[1]);
        cpp_bindgen::generate_c_interface(dst);
    } else {
        cpp_bindgen::generate_c_interface(std::cout);
    }
}
