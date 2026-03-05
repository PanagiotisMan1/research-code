using LinearAlgebra
using Distributions
p=[]
for i in 1:5
    global p=[p; 1/i]
end

for n in 100:100:500 #for small matrices
    for m in 50:50:n
        A=normal_random(n,m,0,1) #creating a kms matrix
        A=transpose(A)*A
        Ainv=inv(A) 
        Mre=0
        D=abs.((diag(Ainv)-hestm1_0(A,p)))./abs.(diag(Ainv)) #n-th term of the sum
        for i in 1:m
            Mre=Mre+D[i] #summing
        end
        Mre=Mre/n
        println("Mre on random ", n, "x", m, " matrix = ",Mre)
    end
end

for n in 1000:500:5000 # doing the same for bigger matrices
    for m in 500:500:n
        A=normal_random(n,m,0,1) #creating a kms matrix
        A=transpose(A)*A
        Ainv=inv(A) 
        Mre=0
        D=abs.((diag(Ainv)-hestm1_0(A,p)))./abs.(diag(Ainv)) #n-th term of the sum
        for i in 1:m
            Mre=Mre+D[i] #summing
        end
        Mre=Mre/n
        println("Mre on random ", n, "x", m, " matrix = ",Mre)
    end
end
