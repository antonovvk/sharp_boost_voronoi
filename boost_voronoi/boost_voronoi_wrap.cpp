// C++ part taken from https://github.com/fabanc/SharpBoostVoronoi/tree/master/C%2B%2BWrapper/BoostVoronoi_4x5x0

#include "boost_voronoi_wrap.hpp"

using namespace boost;

void* boost_voronoi_create() {
  return new Voronoi();
}

void boost_voronoi_delete(void* ptr) {
  auto v = reinterpret_cast<Voronoi*>(ptr);
  if (v) {
    v->Clear();
    delete v;
  }
}

void boost_voronoi_construct(void* ptr) {
  auto v = reinterpret_cast<Voronoi*>(ptr);
  boost::polygon::construct_voronoi(v->points.begin(), v->points.end(), v->segments.begin(), v->segments.end(), &v->vd);
}

void boost_voronoi_clear(void* ptr) {
  auto v = reinterpret_cast<Voronoi*>(ptr);
  v->Clear();
}

void Voronoi::Clear(){
  vertices.clear();
  edges.clear();
  cells.clear();
  vd.clear();
  points.clear();
  segments.clear();
}

Voronoi::~Voronoi(){
  Clear();
}

long long boost_voronoi_count_vertices(const void* ptr) {
  auto v = reinterpret_cast<const Voronoi*>(ptr);
  return v->vd.num_vertices();
}

long long boost_voronoi_count_edges(const void* ptr) {
  auto v = reinterpret_cast<const Voronoi*>(ptr);
  return v->vd.num_edges();
}

long long boost_voronoi_count_cells(const void* ptr) {
  auto v = reinterpret_cast<const Voronoi*>(ptr);
  return v->vd.num_cells();
}

void boost_voronoi_create_vertex_map(void* ptr) {
  auto v = reinterpret_cast<Voronoi*>(ptr);

  long long index = 0;
  for (voronoi_diagram<double>::const_vertex_iterator it = v->vd.vertices().begin(); it != v->vd.vertices().end(); ++it) {
    const voronoi_diagram<double>::vertex_type* vertex = &(*it);
    v->vertices.insert(Voronoi::vertex_position(vertex, index));
    index++;
  }
}

void boost_voronoi_create_edge_map(void* ptr) {
  auto v = reinterpret_cast<Voronoi*>(ptr);

  long long index = 0;
  for (voronoi_diagram<double>::const_edge_iterator it = v->vd.edges().begin(); it != v->vd.edges().end(); ++it) {
    const voronoi_diagram<double>::edge_type* edge = &(*it);
    v->edges.insert(Voronoi::edge_position(edge, index));
    index++;
  }
}

void boost_voronoi_create_cell_map(void* ptr) {
  auto v = reinterpret_cast<Voronoi*>(ptr);

  long long index = 0;
  for (voronoi_diagram<double>::const_cell_iterator it = v->vd.cells().begin(); it != v->vd.cells().end(); ++it) {
    const voronoi_diagram<double>::cell_type* cell = &(*it);
    v->cells.insert(Voronoi::cell_position(cell, index));
    index++;
  }
}

void boost_voronoi_add_point(void* ptr, int x, int y) {
  auto v = reinterpret_cast<Voronoi*>(ptr);

  Point p(x, y);
  v->points.push_back(p);
}

void boost_voronoi_add_segment(void* ptr, int x1, int y1, int x2, int y2) {
  auto v = reinterpret_cast<Voronoi*>(ptr);

  Segment s(x1, y1, x2, y2);
  v->segments.push_back(s);
}

boost_voronoi_vertex_t* boost_voronoi_get_vertex(const void* ptr, long long index) {
  auto v = reinterpret_cast<const Voronoi*>(ptr);

  const voronoi_diagram<double>::vertex_type* vertex = v->vertices.right.at(index);
  auto res = new boost_voronoi_vertex_t();
  res->index = index;
  res->x = vertex->x();
  res->y = vertex->y();
  return res;
}

void boost_voronoi_delete_vertex(boost_voronoi_vertex_t* v) {
  if (v) {
    delete v;
  }
}

boost_voronoi_edge_t* boost_voronoi_get_edge(const void* ptr, long long index) {
  auto v = reinterpret_cast<const Voronoi*>(ptr);

  const voronoi_diagram<double>::edge_type* edge = v->edges.right.at(index);
  //Find vertex references
  const voronoi_diagram<double>::vertex_type * start = edge->vertex0();
  const voronoi_diagram<double>::vertex_type * end = edge->vertex1();

  auto res = new boost_voronoi_edge_t();
  res->index = index;
  res->start_id = v->GetVertexIndex(start);
  res->end_id = v->GetVertexIndex(end);

  //Find the twin reference using the segment object
  const voronoi_diagram<double>::edge_type * twin = edge->twin();
  res->twin_index = -1;
  if (edge != nullptr){
    res->twin_index = v->GetEdgeIndex(twin);
  }

  //Find the cell reference using ther cell object
  res->cell_index = v->GetCellIndex(edge->cell());

  res->is_primary = edge->is_primary() ? 1 : 0;
  res->is_linear = edge->is_linear() ? 1 : 0;
  res->is_finite = edge->is_finite() ? 1 : 0;

  return res;
}

void boost_voronoi_delete_edge(boost_voronoi_edge_t* e) {
  if (e) {
    delete e;
  }
}

boost_voronoi_cell_t* boost_voronoi_get_cell(const void* ptr, long long index) {
  auto v = reinterpret_cast<const Voronoi*>(ptr);

  const voronoi_diagram<double>::cell_type* cell = v->cells.right.at(index);
  std::vector<long long> edge_identifiers;
  std::vector<long long> vertex_identifiers;

  bool is_open = false;

  //Identify the source type
  int source_category = -1;
  if (cell->source_category() == boost::polygon::SOURCE_CATEGORY_SINGLE_POINT){
    source_category = 0;
  }
  else if (cell->source_category() == boost::polygon::SOURCE_CATEGORY_SEGMENT_START_POINT){
    source_category = 1;
  }
  else if (cell->source_category() == boost::polygon::SOURCE_CATEGORY_SEGMENT_END_POINT){
    source_category = 2;
  }
  else if (cell->source_category() == boost::polygon::SOURCE_CATEGORY_INITIAL_SEGMENT){
    source_category = 3;
  }
  else if (cell->source_category() == boost::polygon::SOURCE_CATEGORY_REVERSE_SEGMENT){
    source_category = 4;
  }
  else if (cell->source_category() == boost::polygon::SOURCE_CATEGORY_GEOMETRY_SHIFT){
    source_category = 5;
  }
  else if (cell->source_category() == boost::polygon::SOURCE_CATEGORY_BITMASK){
    source_category = 6;
  }

  const voronoi_diagram<double>::edge_type* edge = cell->incident_edge();
  if (edge != NULL)
  {
    do {
      //Get the edge index
      long long edge_index = v->GetEdgeIndex(edge);
      edge_identifiers.push_back(edge_index);

      if (edge->vertex0() == NULL || edge->vertex1() == NULL)
        is_open = true;

      long long edge_start = -1;
      long long edge_end = -1;

      if (edge->vertex0() == NULL){
        edge_start = v->GetVertexIndex(edge->vertex0());
      }

      if (edge->vertex1() == NULL){
        edge_end = v->GetVertexIndex(edge->vertex1());
      }

      long vertices_count = vertex_identifiers.size();
      if (vertices_count == 0){
        vertex_identifiers.push_back(edge_start);
      }
      else{
        if (vertex_identifiers[vertices_count - 1] != edge_start){
          vertex_identifiers.push_back(edge_start);
        }
      }
      vertex_identifiers.push_back(edge_end);
      //Move to the next edge
      edge = edge->next();

    } while (edge != cell->incident_edge());
  }

  auto res = new boost_voronoi_cell_t();
  res->index = index;
  res->source_index = cell->source_index();
  res->source_category = source_category;
  res->contains_point = cell->contains_point() ? 1 : 0;
  res->contains_segment = cell->contains_segment() ? 1 : 0;
  res->is_open = is_open ? 1 : 0;
  res->is_degenerate = cell->is_degenerate() ? 1 : 0;

  res->n_edge_ids = edge_identifiers.size();
  res->n_vertex_ids = vertex_identifiers.size();
  res->edge_identifiers = new long long[edge_identifiers.size()];
  res->vertex_identifiers = new long long[vertex_identifiers.size()];
  std::copy(edge_identifiers.begin(), edge_identifiers.end(), res->edge_identifiers);
  std::copy(vertex_identifiers.begin(), vertex_identifiers.end(), res->vertex_identifiers);

  return res;
}

void boost_voronoi_delete_cell(boost_voronoi_cell_t* c) {
  if (c) {
    delete [] c->edge_identifiers;
    delete [] c->vertex_identifiers;
    delete c;
  }
}

long long Voronoi::GetVertexIndex(const voronoi_diagram<double>::vertex_type* vertex) const {
  //Search the map and return the index
  if (vertex != NULL){
    return vertices.left.at(vertex);
  }
  return -1;
}

long long Voronoi::GetEdgeIndex(const voronoi_diagram<double>::edge_type* edge) const {
  //Search the map and return the index
  if (edge != NULL){
    return edges.left.at(edge);
  }
  return -1;
}

long long Voronoi::GetCellIndex(const voronoi_diagram<double>::cell_type* cell) const {
  //Search the map and return the index
  if (cell != NULL){
    return cells.left.at(cell);
  }
  return -1;
}
