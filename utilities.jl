using Distributions
function normal_random(rows,columns,mean,v)
    d=Normal(mean,v)
    M=zeros(rows,columns)
    for i in 1:columns
        M[:,i]=rand(d,rows)
    end
    return (M)
end

function vectorwise_MtM(M)
    n = size(M, 2)  # Number of columns in M
    result = Matrix{eltype(M)}(undef, n, n)  # Preallocate the result matrix

    for i in 1:n
        for j in i:n
            result[i, j] = dot(M[:, i], M[:, j])  # Dot product of column i and column j
            result[j, i] = result[i, j]  # Use symmetry of (M^T)M
        end
    end

    return result
end
