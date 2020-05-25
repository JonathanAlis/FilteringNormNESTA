from scipy.sparse import spdiags
import numpy as np
import math

def NESTA(A,At,b,muf,delta,opts):
#function [xk,niter,residuals,outputData,opts] =NESTA(A,At,b,muf,delta,opts)
    pass

#numpy array x
def ValMUTv(x):

    N = len(x)
    n = math.floor(math.sqrt(N))
    Dv = spdiags([reshape([-ones(n-1,n); zeros(1,n)],N,1) reshape([zeros(1,n); ones(n-1,n)],N,1)], [0 1], N, N);
    #    Dv = spdiags([reshape([-ones(n-1,n); zeros(1,n)],N,1) ...
    #        reshape([zeros(1,n); ones(n-1,n)],N,1)], [0 1], N, N);
    #    Dh = spdiags([reshape([-ones(n,n-1) zeros(n,1)],N,1) ...
    #        reshape([zeros(n,1) ones(n,n-1)],N,1)], [0 n], N, N)
    #    D = sparse([Dh;Dv])

    #Dhx = Dh*x;
    #Dvx = Dv*x;
    
    #sk = sqrt(abs(Dhx).^2 + abs(Dvx).^2);
    #th = max(sk);
    #return th


"""
def ValMUHDFilters1D(x,h)
    p=2
    N = length(x)
    H=filter1D2matrix(h,N,'square')
    D=sparse([])
    sk=zeros(size(H{1},1),1)
    for i=1:length(H)
        D=sparse([D;H{i}])
        Hix=H{i}*x
        sk=sk+abs(Hix).^p
    sk=(sk).^(1/p)
    th = max(sk)
    return th,H,D
"""

"""
def ValMUHDFilters2D(x,h):
    p=2
    N = length(x)
    n = floor(sqrt(N))
    H=filter2matrix(h,n,n)    
    D=sparse([])
    sk=zeros(size(x))
    for i=1:length(H)        
        D=sparse([D;H{i}]) 
        Hix=H{i}*x
        sk=sk+abs(Hix).^p
    sk=(sk).^(1/p)
    %sk = sqrt(abs(Dhx).^2 + abs(Dvx).^2)
    th = max(sk)
    return th,H,D
"""

"""
def my_normest(S,St=[],n,tol=1.e-6, maxiter=20)

    if St == []:
        St = S  # we assume the matrix is symmetric;
    x=np.ones(n,1)
    cnt = 0
    e = np.linalg.norm(x)
    if e == 0:
        return
    x = x/e
    e0 = 0
    while np.abs(e-e0) > tol*e and cnt < maxiter:
       e0 = e
       Sx = S[x]
       if nnz[Sx] == 0
          Sx = rand(size(Sx))
       end
       e = norm(Sx)
       x = St(Sx)
       x = x/norm(x)
       cnt = cnt+1
    return e, cnt
"""


def help():
    print("NESTA filtering norm")

if __name__ == "__main__":
    help()
    print(ValMUTv([1, 9, 15, 2,22,2, 35 ,7, 4,3,4,5,6,]))
