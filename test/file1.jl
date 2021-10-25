using TDD
using Test

@testset "file1" begin
    #STEP 1
    graph1 = [ #undirected, not self-referential
        [2,3],
        [1],
        [1],
        [5],
        [4],
    ]
    graph2 = [ #directed, self-referential
        [1,2,3],
        [1,2],
        [3,4],
        [2,4,5],
        [4,5],
    ]

    #given graph (list of lists) and starting node (int)
    #return list of directly-connected neightbors
    @test TDD.returnConnectedNode(graph1, 1) == [1,2,3]
    @test TDD.returnConnectedNode(graph1, 2) == [1,2]
    @test TDD.returnConnectedNode(graph1, 3) == [1,3]
    @test TDD.returnConnectedNode(graph1, 4) == [4,5]
    @test TDD.returnConnectedNode(graph1, 5) == [4,5]

    @test TDD.returnConnectedNode(graph1, 1) == [1,2,3]
    @test TDD.returnConnectedNode(graph2, 2) == [1,2]
    @test TDD.returnConnectedNode(graph2, 3) == [3,4]
    @test TDD.returnConnectedNode(graph2, 4) == [2,4,5]
    @test TDD.returnConnectedNode(graph2, 5) == [4,5]

    
    #STEP 2
    graph3 = [ #directed, not self-referential
        [2,3],
        [],
        [4,5],
        [2,3],
        [3]
    ]

    #given graph and starting node
    #return list of all nodes reachable from node
    @test TDD.returnAllReachableNode(graph1, 1) == [1,2,3]
    @test TDD.returnAllReachableNode(graph1, 2) == [1,2,3]
    @test TDD.returnAllReachableNode(graph1, 3) == [1,2,3]
    @test TDD.returnAllReachableNode(graph1, 4) == [4,5]
    @test TDD.returnAllReachableNode(graph1, 5) == [4,5]

    @test TDD.returnAllReachableNode(graph2, 1) == [1,2,3,4,5]
    @test TDD.returnAllReachableNode(graph2, 2) == [1,2,3,4,5]
    @test TDD.returnAllReachableNode(graph2, 3) == [1,2,3,4,5]
    @test TDD.returnAllReachableNode(graph2, 4) == [1,2,3,4,5]
    @test TDD.returnAllReachableNode(graph2, 5) == [1,2,3,4,5]

    @test TDD.returnAllReachableNode(graph3, 1) == [1,2,3,4,5]
    @test TDD.returnAllReachableNode(graph3, 2) == [2]
    @test TDD.returnAllReachableNode(graph3, 3) == [2,3,4,5]
    @test TDD.returnAllReachableNode(graph3, 4) == [2,3,4,5]
    @test TDD.returnAllReachableNode(graph3, 5) == [2,3,4,5]


end