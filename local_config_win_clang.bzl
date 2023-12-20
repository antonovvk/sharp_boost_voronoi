def _win_clang_config_rule_impl(repository_ctx):
    repository_ctx.file("BUILD", """
platform(
    name = "x64_windows-clang-cl",
    constraint_values = [
        "@platforms//cpu:x86_64",
        "@platforms//os:windows",
        "@bazel_tools//tools/cpp:clang-cl",
    ],
)
""")

win_clang_config_rule = repository_rule(
    local = True,
    implementation = _win_clang_config_rule_impl,
)
