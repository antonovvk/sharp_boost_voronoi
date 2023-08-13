// C++ part taken from https://github.com/fabanc/SharpBoostVoronoi/tree/master/C%2B%2BWrapper/BoostVoronoi_4x5x0

#pragma once

#include <boost/polygon/voronoi.hpp>
#include <boost/bimap.hpp>

#include "boost_voronoi.h"

using boost::polygon::voronoi_builder;
using boost::polygon::voronoi_diagram;
using boost::polygon::voronoi_builder;
using boost::polygon::voronoi_diagram;
using boost::polygon::x;
using boost::polygon::y;
using boost::polygon::low;
using boost::polygon::high;

struct Point {
  double a;
  double b;
  Point(double x, double y) : a(x), b(y) {}
};

struct Segment {
  Point p0;
  Point p1;
  Segment(double x1, double y1, double x2, double y2) : p0(x1, y1), p1(x2, y2) {}
};

namespace boost {
	namespace polygon {
		template <>
		struct geometry_concept < Point > {
			typedef point_concept type;
		};

		template <>
		struct point_traits < Point > {
			typedef int coordinate_type;

			static inline coordinate_type get(
				const Point& point, orientation_2d orient) {
				return (orient == HORIZONTAL) ? point.a : point.b;
			}
		};

		template <>
		struct geometry_concept < Segment > {
			typedef segment_concept type;
		};

		template <>
		struct segment_traits < Segment > {
			typedef int coordinate_type;
			typedef Point point_type;

			static inline point_type get(const Segment& segment, direction_1d dir) {
				return dir.to_int() ? segment.p1 : segment.p0;
			}
		};
	}  // polygon

  class Voronoi {
    public:
			~Voronoi();

			//Data structure for numbering
			typedef boost::bimap<const voronoi_diagram<double>::vertex_type*, long long> vertices_bimap;
			typedef vertices_bimap::value_type vertex_position;
			vertices_bimap vertices;

			typedef boost::bimap<const voronoi_diagram<double>::edge_type*, long long> edges_bimap;
			typedef edges_bimap::value_type edge_position;
			edges_bimap edges;

			typedef boost::bimap<const voronoi_diagram<double>::cell_type*, long long> cells_bimap;
			typedef cells_bimap::value_type cell_position;
			cells_bimap cells;

			std::vector<Point> points;
			std::vector<Segment> segments;
			voronoi_diagram<double> vd;

			long long GetVertexIndex(const voronoi_diagram<double>::vertex_type* vertex) const;
			long long GetEdgeIndex(const voronoi_diagram<double>::edge_type* edge) const;
			long long GetCellIndex(const voronoi_diagram<double>::cell_type* cell) const;

			void Clear();
	};

}  // boost



