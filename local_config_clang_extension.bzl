load("//:local_config_clang.bzl", "clang_config_rule")

clang_extension = module_extension(
    implementation = lambda ctx: clang_config_rule(name = "local_config_clang"),
)
