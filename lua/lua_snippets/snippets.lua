local luaSnip = require("luasnip")

-- snippet
local s = luaSnip.s
-- insert node
local i = luaSnip.i
-- text node
local t = luaSnip.t
-- formatter tool
local fmt = require("luasnip.extras.fmt").fmt

-- cpp snippets
luaSnip.add_snippets("cpp", {
    -- "cp demo"
    s(
        { trig = "demo", name = "Competitive Programming Template", dscr = "A template for competitive programming. "},
        fmt(
            [[
#include <bits/stdc++.h>

#ifndef ONLINE_JUDGE
#include "debug.hpp"
#else
#define debug(...)
#endif

using i64 = long long;
using i128 = __int128;
constexpr int mod = 1e9 + 7;
// constexpr int mod = 998244353;

void solve () {{
    {}
}}

int main() {{
    std::ios::sync_with_stdio(false);
    std::cin.tie(nullptr);

    int t = 1;
    // std::cin >> t;
    while (t--) {{
        solve();
    }}

    return 0;
}}
      ]],
            { i(0) }
        )
    ),

    -- "competitive programming debug header file"
    s(
        { trig = "cpdebug", name = "Generate Custom Debug Header", dscr = "Generates the competitive program debug header." },
        t({
            "#pragma once",
			"#ifndef NO_DEBUG",
			"",
			"#include <iostream>",
			"#include <stack>",
			"#include <string>",
			"#include <vector>",
			"#include <queue>",
			"#include <list>",
			"#include <map>",
			"#include <set>",
			"#include <algorithm>",
			"#include <concepts>",
			"#include <ranges>",
			"",
			"#define RESET   \"\\033[0m\"",
			"#define RED     \"\\033[31m\"      /* Red */",
			"#define GREEN   \"\\033[32m\"      /* Green */",
			"#define YELLOW  \"\\033[33m\"      /* Yellow */",
			"#define BLUE    \"\\033[34m\"      /* Blue */",
			"",
			"using i128 = __int128;",
			"// i128 overloading",
			"inline std::ostream& operator<<(std::ostream& os, i128 val) {",
			"    if (val == 0) return os << \"0\";",
			"",
			"    std::string s = \"\";",
			"    bool neg = val < 0;",
			"    if (neg) val = -val;",
			"",
			"    while (val > 0) {",
			"        s += (val % 10) + '0';",
			"        val /= 10;",
			"    }",
			"",
			"    if (neg) {",
			"        s += '-';",
			"    }",
			"",
			"    std::reverse(s.begin(), s.end());",
			"    return os << s;",
			"}",
			"",
			"// pairlike concept",
			"template <typename T>",
			"concept PairLike = !std::ranges::range<T> && requires(T p) {",
			"    typename T::first_type;",
			"    typename T::second_type;",
			"    { p.first } -> std::convertible_to<const typename T::first_type&>;",
			"    { p.second } -> std::convertible_to<const typename T::second_type&>;",
			"};",
			"",
			"// stack like container concept",
			"template <typename T>",
			"concept StackLike = !std::ranges::range<T> && requires(const T &t) {",
			"    { t.top() };",
			"    { t.empty() };",
			"};",
			"",
			"// queue like container concept",
			"template <typename T>",
			"concept QueueLike = !std::ranges::range<T> && requires(const T& t) {",
			"    { t.front() };",
			"    { t.empty() };",
			"};",
			"",
			"// assocative container concept",
			"template <typename T>",
			"concept AssocativeRange = std::ranges::range<T> && requires {",
			"    typename T::key_type;",
			"    typename T::mapped_type;",
			"};",
			"",
			"// concepts of two dimensional container",
			"template <typename T>",
			"concept RangeOfRanges = (std::ranges::range<T> && std::ranges::range<std::ranges::range_value_t<T>>",
			"                        && !AssocativeRange<T>);",
			"",
			"// concept of one dimensional container",
			"template <typename T>",
			"concept Range = (std::ranges::range<T> && !std::same_as<T, std::string>",
			"            && !RangeOfRanges<T> && !AssocativeRange<T>);",
			"",
			"// base case for all single element",
			"template <typename T>",
			"requires (!std::ranges::range<T> && ",
			"          !std::same_as<T, std::string> &&",
			"          !PairLike<T> &&",
			"          !StackLike<T> &&",
			"          !QueueLike<T>)",
			"",
			"inline void _print (const T &value) {",
			"    std::cerr << value;",
			"}",
			"",
			"// string should be judged separately",
			"inline void _print (const std::string &s) { std::cerr << s; }",
			"inline void _print (const char* c_str) { std::cerr << c_str; }",
			"",
			"// declaration",
			"inline void _print (const PairLike auto &Pair);",
			"inline void _print (const StackLike auto &stack);",
			"inline void _print (const QueueLike auto &queue);",
			"inline void _print (const RangeOfRanges auto &RangeOfRanges);",
			"inline void _print (const AssocativeRange auto &AssocativeContainer);",
			"inline void _print (const Range auto &range);",
			"",
			"// pairlike element implementation",
			"inline void _print (const PairLike auto &Pair) {",
			"    std::cerr << \"(\";",
			"    _print(Pair.first);",
			"    std::cerr << \", \";",
			"    _print(Pair.second);",
			"    std::cerr << \")\";",
			"}",
			"",
			"// stack like element implementation",
			"inline void _print (const StackLike auto &stack) {",
			"    auto copy = stack;",
			"    std::cerr << \"[ \";",
			"    while (!copy.empty()) {",
			"        _print(copy.top());",
			"        copy.pop();",
			"        std::cerr << \" \";",
			"    }",
			"    std::cerr << \"]\";",
			"}",
			"",
			"// queue like element implementation",
			"inline void _print (const QueueLike auto &queue) {",
			"    auto copy = queue;",
			"    std::cerr << \"  [ \";",
			"    while (!copy.empty()) {",
			"        _print(copy.front());",
			"        copy.pop();",
			"        std::cerr << \" \";",
			"    }",
			"    std::cerr << \"]\";",
			"}",
			"",
			"// print one dimensional ",
			"inline void _print (const Range auto &range) {",
			"    std::cerr << \" \";",
			"    for (const auto &element : range) {",
			"        _print(element);",
			"        std::cerr << \" \";",
			"    }",
			"}",
			"",
			"// print two dimensional",
			"inline void _print (const RangeOfRanges auto &RangeOfRanges) {",
			"    std::cerr << \"\\n\";",
			"    for (int p = 0; const auto &innerRange : RangeOfRanges) {",
			"        _print(innerRange);",
			"        if (p != static_cast<int>(RangeOfRanges.size())) {",
			"            std::cerr << \"\\n\";",
			"            p ++;",
			"        }",
			"    }",
			"}",
			"",
			"// print assocative container",
			"inline void _print (const AssocativeRange auto &AssocativeContainer) {",
			"    for (const auto &element : AssocativeContainer) {",
			"        _print(element);",
			"        std::cerr << \" \";",
			"    }",
			"}",
			"",
			"/**",
			" * @brief loop over parameters and print their contents",
			" * ",
			" * @tparam Args ",
			" * @param args ",
			" */",
			"",
			"template<typename... Args>",
			"void debug_print(Args&&... args) {",
			"    const char* separator = \"\"; ",
			"    ([&] {",
			"        std::cerr << separator;",
			"        _print(std::forward<Args>(args));",
			"        separator = \", \";",
			"    }(), ...); // fold expression",
			"}",
			"",
			"inline static int depth = 0;",
			"inline std::string getTracePrefix(int offSet = 0) {",
			"    std::string prefix;",
			"    for(int i = 0; i < depth + offSet; ++i) {",
			"        prefix += \"│   \";",
			"    }",
			"    return prefix;",
			"}",
			"",
			"class RecursionTracer {",
			"private :",
			"    std::string funcName;",
			"",
			"public :",
			"    template<typename... Args>",
			"    RecursionTracer(const std::string &func, const std::string &argsName, Args&&... args) ",
			"        : funcName(func) {",
			"",
			"        std::cerr << getTracePrefix() << \"┌── \" << BLUE << funcName << RESET;",
			"        if(!argsName.empty()) {",
			"            std::cerr << \" \" RED \"[\" << argsName << \"] = \" RESET GREEN \"(\" RESET;",
			"            debug_print(std::forward<Args>(args) ...);",
			"            std::cerr << GREEN \")\" RESET;",
			"        }",
			"",
			"        std::cerr << std::endl;",
			"",
			"        depth ++;",
			"    }",
			"",
			"    ~RecursionTracer() {",
			"        depth --;",
			"        std::cerr << getTracePrefix() << \"└── \" << \"Exiting \" << BLUE << funcName << RESET << std::endl;",
			"    }",
			"};",
			"",
			"#define TRACE_EXPAN(counter) tracer_##counter",
			"#define TRACE_HELPER(counter) TRACE_EXPAN(counter)",
			"",
			"#define trace(...) \\",
			"    RecursionTracer TRACE_HELPER(__COUNTER__)(__func__, #__VA_ARGS__, ##__VA_ARGS__)",
			"",
			"#define debug(...) do { \\",
			"    std::cerr << RED \"[\" #__VA_ARGS__ \"] = \" RESET GREEN \"(\" RESET; \\",
			"    debug_print(__VA_ARGS__); \\",
			"    std::cerr << GREEN \")\" RESET << std::endl; \\",
			"} while (0)",
			"",
			"#define traceLog(...) do { \\",
			"    std::cerr << getTracePrefix(-1) << \"• \" << BLUE << __func__ << RESET; \\",
			"    if constexpr (sizeof(#__VA_ARGS__) > 1) { \\",
			"        std::cerr << \" \" RED \"[\" #__VA_ARGS__ \"] = \" RESET GREEN \"(\" RESET; \\",
			"        debug_print(__VA_ARGS__); \\",
			"        std::cerr << GREEN \")\" RESET; \\",
			"    } \\",
			"    std::cerr << std::endl; \\",
			"} while(0)",
			"",
			"#else ",
			"",
			"#define debug(...)",
			"#define trace(...)",
			"#define traceLog(...)",
			"",
			"#endif",
        })
    )
})

-- makefile snippets
luaSnip.add_snippets("make", {
    s(
        { trig = "cpmake", name = "Makefile for C++ Project", dscr = "Standard Makefile for compiling C++ files." },
        fmt(
            [[
CXX = clang++
CXXFLAGS = -std=c++23 -g -Wall -Wextra

SRCS = $(wildcard *.cpp)
TARGETS = $(SRCS:.cpp=)

all: $(TARGETS)

$(TARGETS): %: %.cpp
	$(CXX) $(CXXFLAGS) $< -o $@

clean:
	rm -f $(TARGETS)

.PHONY: all clean
{}
      ]],
            {
                i(0)
            }
        )
    )
})
