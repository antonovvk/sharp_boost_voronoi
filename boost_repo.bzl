load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
load("@bazel_tools//tools/build_defs/repo:utils.bzl", "maybe")

all_content = """filegroup(name = "all", srcs = glob(["**"]), visibility = ["//visibility:public"])"""

def boost_repo():
    maybe(
        http_archive,
        name = "boost",
        build_file_content = all_content,
        patch_cmds = ["rm -f doc/pdf/BUILD"],
        patch_cmds_win = ["Remove-Item -Force doc/pdf/BUILD"],
        url = "https://github.com/boostorg/boost/releases/download/boost-1.83.0/boost-1.83.0.tar.gz",
        sha256 = "0c6049764e80aa32754acd7d4f179fd5551d8172a83b71532ae093e7384e98da",
        strip_prefix = "boost-1.83.0",
    )
