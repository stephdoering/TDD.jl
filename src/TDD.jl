module TDD

    #Step 1
    function returnConnectedNode(graph::Vector{Vector{Int64}}, node::Int64)
        result = graph[node]
        if !(node in result)
            push!(result, node)
        end
        return sort(result)
    end

end