// Some .NET tests taken from https://github.com/fabanc/SharpBoostVoronoi/blob/master/SharpBoostVoronoi/BoostVoronoiTests

using System.Collections.Generic;
using NUnit.Framework;

namespace VoronoiWrapperTests
{
    [TestFixture]
    internal class VoronoiWrapperTests
    {
        private VoronoiWrapper _vw;

        [SetUp]
        public void Setup()
        {
            _vw = new VoronoiWrapper();

            _vw.AddPoint(5, 5);
            _vw.AddSegment(0, 0, 0, 10);
            _vw.AddSegment(0, 10, 10, 10);
            _vw.AddSegment(10, 10, 10, 0);
            _vw.AddSegment(10, 0, 0, 0);

            _vw.Construct();
            _vw.CreateVertexMap();
            _vw.CreateEdgeMap();
            _vw.CreateCellMap();
        }

        [Test]
        public void TestPrimaryEdges()
        {
            long countEdges = _vw.CountEdges();
            int countPrimary = 0;
            int countSecondary = 0;
            int countFinite = 0;
            for (int i = 0; i < countEdges; i++)
            {
                var edge = _vw.GetEdge(i);
                if (edge.Item4)
                    countPrimary++;

                if (edge.Item6)
                    countFinite++;

                if (!edge.Item4 && edge.Item6)
                    countSecondary++;
            }

            Assert.AreEqual(32, countEdges);
            Assert.AreEqual(16, countFinite);
            Assert.AreEqual(0, countSecondary);
            Assert.AreEqual(countPrimary, countFinite - countSecondary);
        }

        [Test]
        public void TestGetCellVertices()
        {
            for (int i = 0; i < _vw.CountCells(); i++)
            {
                var cell = _vw.GetCell(i);
                if (!cell.Item4.Item3)
                {
                    List<long> vertexIndexes = cell.Item6;
                    Assert.AreEqual(vertexIndexes.Count, 5);
                    Assert.AreEqual(vertexIndexes[0], vertexIndexes[^1]);
                }
            }
        }
    }
}
