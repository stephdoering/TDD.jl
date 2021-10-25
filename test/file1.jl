using Test

@testset "file1" begin
    #STEP 1
    graph1 = [ #undirected, not self-referential
        [2,3]
        [1]
        [1]
        [5]
        [4]
    ]
    graph2 = [ #directed, self-referential
        [1,2,3]
        [1,2]
        [3,4]
        [2,4,5]
        [4,5]
    ]

    #given graph (list of lists) and starting node (int)
    #return list of directly-connected neightbors
    @test returnConnectedNode(graph1, 1) == [1,2,3]
    @test returnConnectedNode(graph1, 2) == [1,2]
    @test returnConnectedNode(graph1, 3) == [1,3]
    @test returnConnectedNode(graph1, 4) == [4,5]
    @test returnConnectedNode(graph1, 5) == [4,5]

    @test returnConnectedNode(graph1, 1) == [1,2,3]
    @test returnConnectedNode(graph2, 2) == [1,2]
    @test returnConnectedNode(graph2, 3) == [3,4]
    @test returnConnectedNode(graph2, 4) == [2,4,5]
    @test returnConnectedNode(graph2, 5) == [4,5]



    
end