from contexts import ProjectQContext
from projectq.ops import CNOT, Rx, Rz, Tensor, Z, X, C
from projectq.setups import default

from profilehooks import profile

def apply_entangler(qureg, pos):
    for i in pos:
        C(X) | (qureg[i], qureg[(i+1)%len(qureg)])


def apply_block(reg, theta, trafie):
    nbit = len(reg)
    apply_entangler(reg, range(0, nbit, 2))
    Tensor(Rz(theta)) | reg[1:nbit:2]
    apply_entangler(reg, list(range(0, nbit, 2)) + list(range(1, nbit, 2)))
    
    Tensor(Rz(theta)) | reg[0:nbit:2]
    apply_entangler(reg, range(1, nbit, 2))
    
    Tensor(Rx(trafie)) | reg


#@profile
def dynamical_qft(nbit, g, tmax, nslice):
    dt = tmax/nslice
    trafie = dt*g
    theta = -dt
    
    res = []
    with ProjectQContext(nbit, 'simulate') as cc:
        for i in range(nslice):
            apply_block(cc.qureg, theta, trafie)
            wf1 = cc.get_wf()
            Z | cc.qureg[5]
            wf2 = cc.get_wf()
            Z | cc.qureg[5]
            res.append(wf1.conj().dot(wf2).real)
    return res


nslice = 500
tmax = 10

#dynamical_qft(18, 2.0, 10.0, 500);
get_ipython().run_line_magic('timeit', 'dynamical_qft(18, 2.0, 10.0, 500)')
