using System;
using System.Collections.Generic;
using System.Reflection;
using System.Runtime.InteropServices;
using Bazel;

[StructLayout(LayoutKind.Sequential)]
public struct boost_voronoi_vertex_t {
    public Int64 index;
    public Int64 x, y;
}

[StructLayout(LayoutKind.Sequential)]
public struct boost_voronoi_edge_t {
    public Int64 index;
    public Int64 start_id, end_id;
    public Int64 twin_index, cell_index;
    public Int64 is_primary, is_linear, is_finite;
}

[StructLayout(LayoutKind.Sequential)]
public unsafe struct boost_voronoi_cell_t {
    public Int64 index, source_index;
    public Int64 n_edge_ids, n_vertex_ids;
    public Int64* edge_identifiers;
    public Int64* vertex_identifiers;
    public Int64 source_category;
    public Int64 contains_point, contains_segment, is_open, is_degenerate;
}

public unsafe class VoronoiWrapper : IDisposable {
    public bool Disposed { get; set; } = false;

    private void* _ptr;

    public VoronoiWrapper ()
    {
        _ptr = Interop.boost_voronoi_create();
    }

    public void Dispose()
    {
        Dispose(true);
        GC.SuppressFinalize(this);
    }

    // Protected implementation of Dispose pattern.
    protected virtual void Dispose(bool disposing)
    {
        if (Disposed)
            return;

        // Free any unmanaged objects here.
        Interop.boost_voronoi_delete(_ptr);

        Disposed = true;
    }

    public void AddPoint(Int32 x, Int32 y)
    {
        Interop.boost_voronoi_add_point(_ptr, x, y);
    }

    public void AddSegment(Int32 x1, Int32 y1, Int32 x2, Int32 y2)
    {
        Interop.boost_voronoi_add_segment(_ptr, x1, y1, x2, y2);
    }

    public void Construct()
    {
        Interop.boost_voronoi_construct(_ptr);
    }

    public void Clear()
    {
        Interop.boost_voronoi_clear(_ptr);
    }

    public long CountVertices()
    {
        return Interop.boost_voronoi_count_vertices(_ptr);
    }

    public long CountEdges()
    {
        return Interop.boost_voronoi_count_edges(_ptr);
    }

    public long CountCells()
    {
        return Interop.boost_voronoi_count_cells(_ptr);
    }

    public void CreateVertexMap()
    {
        Interop.boost_voronoi_create_vertex_map(_ptr);
    }

    public void CreateEdgeMap()
    {
        Interop.boost_voronoi_create_edge_map(_ptr);
    }

    public void CreateCellMap()
    {
        Interop.boost_voronoi_create_cell_map(_ptr);
    }

    public Tuple<long, double, double> GetVertex(Int64 index)
    {
        var v = Interop.boost_voronoi_get_vertex(_ptr, index);
        var t = new Tuple<long, double, double>(v->index, v->x, v->y);
        Interop.boost_voronoi_delete_vertex(v);
        return t;
    }

    public Tuple<long, long, long, bool, bool, bool, Tuple<long, long>> GetEdge(Int64 index)
    {
        var e = Interop.boost_voronoi_get_edge(_ptr, index);
        var t = new Tuple<long, long, long, bool, bool, bool, Tuple<long, long>>(
            e->index,
            e->start_id,
            e->end_id,
            e->is_primary == 1,
            e->is_linear == 1,
            e->is_finite == 1,
            new Tuple<long, long>(e->twin_index, e->cell_index)
        );
        Interop.boost_voronoi_delete_edge(e);
        return t;
    }

    public Tuple<long, long, short, Tuple<bool, bool, bool, bool>, List<long>, List<long>> GetCell(Int64 index)
    {
        var c = Interop.boost_voronoi_get_cell(_ptr, index);
        var t = new Tuple<long, long, short, Tuple<bool, bool, bool, bool>, List<long>, List<long>>(
            c->index,
            c->source_index,
            (short)(c->source_category),
            new Tuple<bool, bool, bool, bool>(
                c->contains_point == 1,
                c->contains_segment == 1,
                c->is_open == 1,
                c->is_degenerate == 1
            ),
            new List<long>(),
            new List<long>()
        );
        for (int i = 0; i < c->n_edge_ids; i++)
        {
            t.Item5.Add(c->edge_identifiers[i]);
        }
        for (int i = 0; i < c->n_vertex_ids; i++)
        {
            t.Item6.Add(c->vertex_identifiers[i]);
        }
        Interop.boost_voronoi_delete_cell(c);
        return t;
    }

    static class Interop {
        const string BoostVoronoi = "boost_voronoi";

        static Interop ()
        {
            NativeLibrary.SetDllImportResolver(typeof(Interop).Assembly, ImportResolver);
        }

        private static IntPtr ImportResolver(string libraryName, Assembly assembly, DllImportSearchPath? searchPath)
        {
            IntPtr libHandle = IntPtr.Zero;
            if (libraryName == BoostVoronoi)
            {
                var manifestPath = Runfiles.Create().Rlocation("MANIFEST");
                var runfiles = Runfiles.Create("", new Dictionary<string, string>{
                    {"RUNFILES_MANIFEST_ONLY", "1"},
                    {"RUNFILES_MANIFEST_FILE", manifestPath},
                });
                var path = runfiles.Rlocation("_main/boost_voronoi/libboost_voronoi.so");
                NativeLibrary.TryLoad(path, assembly, DllImportSearchPath.System32, out libHandle);
            }
            return libHandle;
        }

        [DllImport(BoostVoronoi, EntryPoint = "boost_voronoi_create")]
        public extern unsafe static void* boost_voronoi_create();

        [DllImport(BoostVoronoi)]
        public extern unsafe static void boost_voronoi_delete(void* ptr);

        [DllImport(BoostVoronoi)]
        public extern unsafe static void boost_voronoi_add_point(void* ptr, int x, int y);

        [DllImport(BoostVoronoi)]
        public extern unsafe static void boost_voronoi_add_segment(void* ptr, int x1, int y1, int x2, int y2);

        [DllImport(BoostVoronoi)]
        public extern unsafe static void boost_voronoi_construct(void* ptr);

        [DllImport(BoostVoronoi)]
        public extern unsafe static void boost_voronoi_clear(void* ptr);

        [DllImport(BoostVoronoi)]
        public extern unsafe static long boost_voronoi_count_vertices(void* ptr);

        [DllImport(BoostVoronoi)]
        public extern unsafe static long boost_voronoi_count_edges(void* ptr);

        [DllImport(BoostVoronoi)]
        public extern unsafe static long boost_voronoi_count_cells(void* ptr);

        [DllImport(BoostVoronoi)]
        public extern unsafe static void boost_voronoi_create_vertex_map(void* ptr);

        [DllImport(BoostVoronoi)]
        public extern unsafe static void boost_voronoi_create_edge_map(void* ptr);

        [DllImport(BoostVoronoi)]
        public extern unsafe static void boost_voronoi_create_cell_map(void* ptr);

        [DllImport(BoostVoronoi)]
        public extern unsafe static boost_voronoi_vertex_t* boost_voronoi_get_vertex(void* ptr, Int64 i);

        [DllImport(BoostVoronoi)]
        public extern unsafe static void boost_voronoi_delete_vertex(boost_voronoi_vertex_t* v);

        [DllImport(BoostVoronoi)]
        public extern unsafe static boost_voronoi_edge_t* boost_voronoi_get_edge(void* ptr, Int64 i);

        [DllImport(BoostVoronoi)]
        public extern unsafe static void boost_voronoi_delete_edge(boost_voronoi_edge_t* e);

        [DllImport(BoostVoronoi)]
        public extern unsafe static boost_voronoi_cell_t* boost_voronoi_get_cell(void* ptr, Int64 i);

        [DllImport(BoostVoronoi)]
        public extern unsafe static void boost_voronoi_delete_cell(boost_voronoi_cell_t* c);
    };
};
