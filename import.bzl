load("@bazel_skylib//rules:common_settings.bzl", "BuildSettingInfo")
load("@rules_dotnet//dotnet/private:providers.bzl", "DotnetAssemblyCompileInfo", "DotnetAssemblyRuntimeInfo")

def _import_native_so_impl(ctx):
    name = ctx.label.name
    native = ctx.attr.src.files.to_list()

    ci = DotnetAssemblyCompileInfo(
        name = name,
        version = ctx.attr.version,
        analyzers = [],
        compile_data = native,
        exports = [],
        internals_visible_to = ctx.attr.internals_visible_to,
        refs = [],
        irefs = [],
    )

    ri = DotnetAssemblyRuntimeInfo(
        name = ctx.label.name,
        libs = [],
        data = native,
        native = native,
        version = ctx.attr.version,
        deps = depset(),
        nuget_info = None,
        direct_deps_depsjson_fragment = None,
    )

    return [
        ci,
        ri,
        DefaultInfo(files = depset([native[0]])),
    ]

import_native_so = rule(
    _import_native_so_impl,
    attrs = {
        "src": attr.label(mandatory = True, doc = "The file to be transformed into [DotnetAssemblyCompileInfo]"),
        "version": attr.string(mandatory = True, doc = "Version of the imported assembly."),
        "internals_visible_to": attr.string_list(),
    },
    provides = [DotnetAssemblyCompileInfo, DotnetAssemblyRuntimeInfo],
    executable = False,
)
