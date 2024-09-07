"Generated"

load(":paket.sharp_boost_voronoi_deps.bzl", _sharp_boost_voronoi_deps = "sharp_boost_voronoi_deps")

def _sharp_boost_voronoi_deps_impl(_ctx):
    _sharp_boost_voronoi_deps()

sharp_boost_voronoi_deps_extension = module_extension(
    implementation = _sharp_boost_voronoi_deps_impl,
)
