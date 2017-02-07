from numpy import zeros
from scipy.signal import cspline2d
class PCNN:
    f,l,t1,t2, beta = 0.9, 0.8, 0.8, 50.0, 0.2
    # constructor
    def __init__ (self,dim):
        self.F = zeros( dim,float)
        self.L = zeros( dim, float)
        self.Y = zeros( dim,float)
        self.T = zeros( dim,float) + 0.0001
        

    def Iterate (self,stim):
        if self.Y.sum() > 0:
            work = cspline2d(self.Y.astype(float),90)
        else:
            work = zeros(self.Y.shape,float)
        self.F = self.f * self.F + stim + 8*work
        self.L = self.l * self.L + 8*work
        U = self.F * (1 + self.beta * self.L )
        self.Y = U > self.T
        self.T = self.t1 * self.T + self.t2 * self.Y + 0.1