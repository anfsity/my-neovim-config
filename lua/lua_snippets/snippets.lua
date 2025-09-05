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
#include <iostream>
#include <string>
#include <vector>
#include <algorithm>
#include <numeric>
#include <queue>
#include <set>
#include <map>
#include <cmath>
#include <ranges>

#ifndef ONLINE_JUDGE
#include "debug.hpp"
#else
#define debug(...)
#endif

using std::cin;
using std::cout;
using i64 = long long;
using u64 = unsigned long long;
using i128 = __int128;
using u128 = unsigned __int128;
namespace views = std::views;
namespace ranges = std::ranges;
#define nl '\n'
constexpr int mod = 1e9 + 7;
// constexpr int mod = 998244353;

void solve() {{
    {}
}}

int main() {{
    std::ios::sync_with_stdio(false);
    cin.tie(nullptr);

    int t = 1;
    // cin >> t;
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
            '#pragma once',
            '#ifndef NO_DEBUG',
            '',
            '#include <iostream>',
            '#include <stack>',
            '#include <string>',
            '#include <vector>',
            '#include <queue>',
            '#include <list>',
            '#include <map>',
            '#include <set>',
            '#include <algorithm>',
            '',
            '#define RESET   "\\033[0m"',
            '#define RED     "\\033[31m"      /* Red */',
            '#define GREEN   "\\033[32m"      /* Green */',
            '#define YELLOW  "\\033[33m"      /* Yellow */',
            '#define BLUE    "\\033[34m"      /* Blue */',
            'using i128 = __int128;',
            'std::ostream& operator<<(std::ostream& os, i128 val) {',
            '    if (val == 0) return os << "0";',
            '',
            '    std::string s = "";',
            '    bool neg = val < 0;',
            '    if (neg) val = -val;',
            '',
            '    while (val > 0) {',
            '        s += (val % 10) + \'0\';',
            '        val /= 10;',
            '    }',
            '',
            '    if (neg) {',
            '        s += \'-\';',
            '    }',
            '',
            '    std::reverse(s.begin(), s.end());',
            '    return os << s;',
            '}',
            ' ',
            'template <typename T>',
            'void _print(const T x) {',
            '    std::cerr << x;',
            '}',
            '',
            'inline void _print(const char *x) {',
            '    std::cerr << x;',
            '}',
            '',
            'inline void _print(const bool x) {',
            '    std::cerr << x;',
            '}',
            '',
            'inline void _print(const std::string x) {',
            '    std::cerr << x;',
            '}',
            '',
            '/**',
            ' * @brief pair ',
            ' * ',
            ' * @tparam T ',
            ' * @tparam V ',
            ' * @param x ',
            ' */',
            '',
            'template <typename T, typename V>',
            'void _print(const std::pair<T, V> &x) {',
            '    auto& [_f, _s] = x;',
            '    std::cerr << \'{\';',
            '    _print(_f);',
            '    std::cerr << ", ";',
            '    _print(_s);',
            '    std::cerr << \'}\';',
            '}',
            '',
            '/**',
            ' * @brief ',
            ' * ',
            ' * @tparam Iter ',
            ' * @param begin ',
            ' * @param end ',
            ' */',
            '',
            'template <typename Iter>',
            'void _print(Iter begin, Iter end) {',
            '    std::cerr << "[ ";',
            '    bool _f = true;',
            '    while(begin != end) {',
            '        if(not _f) std::cerr << " ";',
            '        _print(*begin);',
            '        _f = false;',
            '        ++begin;',
            '    }',
            '    std::cerr << " ]";',
            '}',
            '',
            '// vector ',
            'template <typename T> ',
            'void _print(const std::vector<T>& V) {',
            '    _print(V.begin(), V.end());',
            '}',
            '',
            '// two-dimensional vector',
            'template <typename T>',
            'void _print(const std::vector<std::vector<T>>& V) {',
            '    std::cerr << "\\n";',
            '    for(const auto &elem : V) {',
            '        _print(elem.begin(), elem.end());',
            '        std::cerr << "\\n";',
            '    }',
            '}',
            '',
            '// deque',
            'template <typename T>',
            'void _print(const std::deque<T>& D) {',
            '    _print(D.begin(), D.end());',
            '}',
            '',
            '// list ',
            'template <typename T>',
            'void _print(const std::list<T> &L) {',
            '    _print(L.begin(), L.end());',
            '}',
            '',
            '// set',
            'template <typename T>',
            'void _print(const std::set<T> &S) {',
            '    _print(S.begin(), S.end());',
            '}',
            '',
            '// multiset',
            'template <typename T>',
            'void _print(const std::multiset<T> &S) {',
            '    _print(S.begin(), S.end());',
            '}',
            '',
            '// map',
            'template <typename T, typename V>',
            'void _print(const std::map<T, V> &M) {',
            '    _print(M.begin(), M.end());',
            '}',
            '',
            '// multimap',
            'template <typename T, typename V>',
            'void _print(const std::multimap<T, V> &M) {',
            '    _print(M.begin(), M.end());',
            '}',
            '',
            '// queue',
            'template <typename T>',
            'void _print(const std::queue<T>& Q) {',
            '    std::queue<T> Q_copy = Q;',
            '    std::vector<T> vec;',
            '    while(!Q_copy.empty()) {',
            '        vec.emplace_back(Q_copy.front());',
            '        Q_copy.pop();',
            '    }',
            '    _print(vec);',
            '}',
            '',
            '// stack',
            'template <typename T>',
            'void _print(const std::stack<T>& S) {',
            '    std::stack<T> S_copy = S;',
            '    std::vector<T> vec;',
            '    while(!S_copy.empty()) {',
            '        vec.emplace_back(S_copy.top());',
            '        S_copy.pop();',
            '    }',
            '    std::ranges::reverse(vec);',
            '    _print(vec);',
            '};',
            '',
            '/**',
            ' * @brief ',
            ' * ',
            ' * @tparam Args ',
            ' * @param args ',
            ' */',
            '',
            'template<typename... Args>',
            'void debug_print(Args&&... args) {',
            '    const char* separator = ""; ',
            '    ([&] {',
            '        std::cerr << separator;',
            '        _print(std::forward<Args>(args));',
            '        separator = ", ";',
            '    }(), ...);',
            '}',
            '',
            'inline static int depth = 0;',
            'inline std::string getTracePrefix(int offSet = 0) {',
            '    std::string prefix;',
            '    for(int i = 0; i < depth + offSet; ++i) {',
            '        prefix += "│   ";',
            '    }',
            '    return prefix;',
            '}',
            '',
            'class RecursionTracer {',
            'private :',
            '    std::string funcName;',
            '',
            'public :',
            '    template<typename... Args>',
            '    RecursionTracer(const std::string &func, const std::string &argsName, Args&&... args) ',
            '        : funcName(func) {',
            '',
            '        std::cerr << getTracePrefix() << "┌── " << BLUE << funcName << RESET;',
            '        if(!argsName.empty()) {',
            '            std::cerr << " " RED "[" << argsName << "] = " RESET GREEN "(" RESET;',
            '            debug_print(std::forward<Args>(args) ...);',
            '            std::cerr << GREEN ")" RESET;',
            '        }',
            '',
            '        std::cerr << std::endl;',
            '',
            '        depth ++;',
            '    }',
            '',
            '    ~RecursionTracer() {',
            '        depth --;',
            '        std::cerr << getTracePrefix() << "└── " << "Exiting " << BLUE << funcName << RESET << std::endl;',
            '    }',
            '};',
            '',
            '#define TRACE_EXPAN(counter) tracer_##counter',
            '#define TRACE_HELPER(counter) TRACE_EXPAN(counter)',
            '',
            '#define trace(...) \\',
            '    RecursionTracer TRACE_HELPER(__COUNTER__)(__func__, #__VA_ARGS__, ##__VA_ARGS__)',
            '',
            '#define debug(...) do { \\',
            '    std::cerr << RED "[" #__VA_ARGS__ "] = " RESET GREEN "(" RESET; \\',
            '    debug_print(__VA_ARGS__); \\',
            '    std::cerr << GREEN ")" RESET << std::endl; \\',
            '} while (0)',
            '',
            '#define traceLog(...) do { \\',
            '    std::cerr << getTracePrefix(-1) << "• " << BLUE << __func__ << RESET; \\',
            '    if constexpr (sizeof(#__VA_ARGS__) > 1) { \\',
            '        std::cerr << " " RED "[" #__VA_ARGS__ "] = " RESET GREEN "(" RESET; \\',
            '        debug_print(__VA_ARGS__); \\',
            '        std::cerr << GREEN ")" RESET; \\',
            '    } \\',
            '    std::cerr << std::endl; \\',
            '} while(0)',
            '    ',
            '#else ',
            '',
            '#define debug(...)',
            '#define trace(...)',
            '#define traceLog(...)',
            '',
            '#endif',
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
