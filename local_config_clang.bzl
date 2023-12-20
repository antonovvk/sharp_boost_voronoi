def _clang_config_rule_impl(repository_ctx):
    repository_ctx.file("BUILD", """
platform(
    name = "clang-cl",
    constraint_values = [
        "@bazel_tools//tools/cpp:clang-cl",
    ],
)
""")

clang_config_rule = repository_rule(
    local = True,
    implementation = _clang_config_rule_impl,
)
