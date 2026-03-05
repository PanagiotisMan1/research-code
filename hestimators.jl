function hest_m1(x,A)
    #mvp's
    mvp1=A*x;
    #ip's
    ip2=dot(x,mvp1);
    ip3=dot(mvp1,mvp1);
    #powers
    ip2=ip2^3;
    ip3=ip3^2;
    #division
    return ip2/ip3
end
function hest_m1_rel(x,A,tv) #tv meaning theoretical value
    return abs(hest_m1(x,A)-tv)/abs(tv)
end
