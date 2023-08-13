#pragma once

#ifdef __cplusplus
extern "C" {
#endif

void* boost_voronoi_create();
void boost_voronoi_delete(void* ptr);

void boost_voronoi_add_point(void* ptr, int x, int y);
void boost_voronoi_add_segment(void* ptr, int x1, int y1, int x2, int y2);
void boost_voronoi_construct(void* ptr);
void boost_voronoi_clear(void* ptr);
long long boost_voronoi_count_vertices(const void* ptr);
long long boost_voronoi_count_edges(const void* ptr);
long long boost_voronoi_count_cells(const void* ptr);
void boost_voronoi_create_vertex_map(void* ptr);
void boost_voronoi_create_edge_map(void* ptr);
void boost_voronoi_create_cell_map(void* ptr);

typedef struct boost_voronoi_vertex_t
{
  long long index;
  long long x, y;
} boost_voronoi_vertex_t;

boost_voronoi_vertex_t* boost_voronoi_get_vertex(const void* ptr, long long i);
void boost_voronoi_delete_vertex(boost_voronoi_vertex_t* v);

typedef struct boost_voronoi_edge_t
{
  long long index;
  long long start_id, end_id;
  long long twin_index, cell_index;
  long long is_primary, is_linear, is_finite;
} boost_voronoi_edge_t;

boost_voronoi_edge_t* boost_voronoi_get_edge(const void* ptr, long long i);
void boost_voronoi_delete_edge(boost_voronoi_edge_t* e);

typedef struct boost_voronoi_cell_t
{
  long long index, source_index;
  long long n_edge_ids, n_vertex_ids;
  long long* edge_identifiers;
  long long* vertex_identifiers;
  long long source_category;
  long long contains_point, contains_segment, is_open, is_degenerate;
} boost_voronoi_cell_t;

boost_voronoi_cell_t* boost_voronoi_get_cell(const void* ptr, long long i);
void boost_voronoi_delete_cell(boost_voronoi_cell_t* c);

#ifdef __cplusplus
}
#endif
