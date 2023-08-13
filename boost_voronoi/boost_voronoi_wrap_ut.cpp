#include "gtest/gtest.h"
#include "boost_voronoi_wrap.hpp"

using namespace boost;

TEST(BoostVoronoi, PrimaryEdges) {
    auto bv = boost_voronoi_create();

    boost_voronoi_add_point(bv, 5, 5);
    boost_voronoi_add_segment(bv, 0, 0, 0, 10);
    boost_voronoi_add_segment(bv, 0, 10, 10, 10);
    boost_voronoi_add_segment(bv, 10, 10, 10, 0);
    boost_voronoi_add_segment(bv, 10, 0, 0, 0);

    boost_voronoi_construct(bv);
    boost_voronoi_create_vertex_map(bv);
    boost_voronoi_create_edge_map(bv);
    boost_voronoi_create_cell_map(bv);

    auto countEdges = boost_voronoi_count_edges(bv);
    EXPECT_EQ(32, countEdges);

    int countPrimary = 0;
    int countSecondary = 0;
    int countFinite = 0;
    for (int i = 0; i < countEdges; i++) {
        auto edge = boost_voronoi_get_edge(bv, i);
        if (edge->is_primary)
            countPrimary++;

        if (edge->is_finite)
            countFinite++;

        if (!edge->is_primary && edge->is_finite)
            countSecondary++;

        boost_voronoi_delete_edge(edge);
    }
    EXPECT_EQ(16, countPrimary);
    EXPECT_EQ(0, countSecondary);
    EXPECT_EQ(countPrimary, countFinite - countSecondary);

    boost_voronoi_clear(bv);
    boost_voronoi_delete(bv);
}
