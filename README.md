<a href="https://GridTools.github.io/gridtools"><img src="https://gridtools.github.io/gridtools/latest/_static/logo.svg"/></a>
<br/><br/>
<a target="_blank" href="https://opensource.org/licenses/BSD-3-Clause">![License: BSD][BSD.License]</a>

**cpp_bindgen** is a library to generate C and Fortran bindings for C++ functions from C++. It is part of the GridTools framework, a set of libraries and utilities to develop performance portable applications in the area of weather and climate.

Currently the documentation of **cpp_bindgen** is part of the [GridTools documentation](https://gridtools.github.io/gridtools/latest/user_manual/user_manual.html#interfacing-to-other-programming-languages). For simple examples, see the examples folder of this repository. More advanced examples are available in https://github.com/GridTools/gridtools.

### Installation instructions

You can easily integrate **cpp_bindgen** in your CMake project with the following snippet which makes the function `bindgen_add_library()` available.

```cmake
include(FetchContent)
FetchContent_Declare(
  cpp_bindgen
  GIT_REPOSITORY https://github.com/GridTools/cpp_bindgen.git
  GIT_TAG        master # consider replacing master by a tagged version
)
FetchContent_MakeAvailable(cpp_bindgen)
```

See also https://github.com/GridTools/cpp_bindgen/tree/master/example/simple_fetch_content.

##### Requirements

- Boost (1.65.1 or later)
- CMake (3.14.5 or later)

##### Known issues

- The library doesn't work with NVCC <= 9.2 using Clang as host compiler, if c++14 is enabled, due to a bug in NVCC.

### Continuous integration

We use Jenkins to test this library. To test your PR use
- `launch jenkins` to execute the tests which are part of this repository.
- `launch gridtools` to run the changes against the GridTools integration tests from the GridTools/gridtools repository.

### Contributing

Contributions to the GridTools framework are welcome. Please open an issue for any bugs that you encounter or provide a fix or enhancement as a PR. External contributions to GridTools require us a signed copy of a copyright release form to ETH Zurich. We will contact you on the PR.

[BSD.License]: https://img.shields.io/badge/License-BSD--3--Clause-blue.svg
