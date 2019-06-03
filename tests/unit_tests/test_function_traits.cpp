#include <cpp_bindgen/common/function_traits.hpp>

namespace ft = cpp_bindgen::function_traits;
static_assert(std::is_same<typename ft::result_type<void(int)>::type, void>::value, "");
static_assert(std::is_same<typename ft::result_type<void(int, double)>::type, void>::value, "");
static_assert(std::is_same<typename ft::result_type<int(int, double)>::type, int>::value, "");

static_assert(std::is_same<typename ft::parameter_types<void()>::type, std::tuple<>>::value, "");
static_assert(std::is_same<typename ft::parameter_types<void(int)>::type, std::tuple<int>>::value, "");
static_assert(std::is_same<typename ft::parameter_types<void(int, double)>::type, std::tuple<int, double>>::value, "");
static_assert(std::is_same<typename ft::parameter_types<int(int, double)>::type, std::tuple<int, double>>::value, "");

static_assert(ft::arity<void()>::value == 0, "");
static_assert(ft::arity<void(int)>::value == 1, "");
static_assert(ft::arity<void(int, double)>::value == 2, "");
static_assert(ft::arity<int(int, double)>::value == 2, "");
