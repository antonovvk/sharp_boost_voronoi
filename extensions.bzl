load("//:boost_repo.bzl", "boost_repo")

def _non_module_dependencies_impl(_ctx):
    boost_repo()

non_module_dependencies = module_extension(
    implementation = _non_module_dependencies_impl,
)
