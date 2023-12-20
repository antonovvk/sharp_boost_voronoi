load("//:local_config_win_clang.bzl", "win_clang_config_rule")

win_clang_extension = module_extension(
    implementation = lambda ctx: win_clang_config_rule(name = "local_config_win_clang"),
)
