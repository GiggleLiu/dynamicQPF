# Simulating Dynamical Quantum Phase Transition

## Model Description
1D Hamiltonian with periodic boundary condition
$$ H(g) = -\sum_j \sigma_j^z\sigma_{j+1}^z + g\sigma_j^x $$

Using Trotter decomposition, build a circuit with 500 steps, dt = 0.02.

The circuit and results can be found in Ref. Hong 2018.

## Benchmark (single thread)
### Setup
To Run Benchmarks in `src` folder
##### Yao.jl
1. Download and install [Julia](https://julialang.org/downloads/)
2. Install packages [Yao](https://github.com/QuantumBFS/Yao.jl) and [BenchmarkTools](https://github.com/JuliaCI/BenchmarkTools.jl)
3. To run benchmark code, type
```bash
$ julia dqpt_yao.jl
```

##### QtVM
TODO

##### ProjectQ
1. Download and install [Anaconda](https://www.anaconda.com/download/)
2. Install package [ProjectQ](https://projectq.readthedocs.io/en/latest/tutorials.html)
3. To run benchmark code, type
```bash
$ ipython dqpt_projectq.py
```
### Results of Single Thread Benchmark
The running time (in seconds)

| Package         | 10 qubits | 20 qubits | 30 qubits |
| --------------- | --------- | --------- | --------- |
| Yao v0.2.0      |   0.03    |     52    |           |
| QtVM            |           |           |           |
| ProjectQ v0.4.1 |   2.06    |    226    |           |


## References
1. Hong, Q., Ge, Z., Wang, W., Lang, H., Wang, Z., Chen, J., … Fan, H. (n.d.). A Universal Quantum Computing Virtual Machine, 1–10.
2. https://github.com/QuantumBFS/Yao.jl
3. https://github.com/ProjectQ-Framework/ProjectQ

## CPU Info
```
Architecture:          x86_64
CPU op-mode(s):        32-bit, 64-bit
Byte Order:            Little Endian
CPU(s):                32
On-line CPU(s) list:   0-31
Thread(s) per core:    2
Core(s) per socket:    8
Socket(s):             2
NUMA node(s):          2
Vendor ID:             GenuineIntel
CPU family:            6
Model:                 45
Model name:            Intel(R) Xeon(R) CPU E5-2690 0 @ 2.90GHz
Stepping:              7
CPU MHz:               2900.064
BogoMIPS:              5799.21
Virtualization:        VT-x
L1d cache:             32K
L1i cache:             32K
L2 cache:              256K
L3 cache:              20480K
NUMA node0 CPU(s):     0,2,4,6,8,10,12,14,16,18,20,22,24,26,28,30
NUMA node1 CPU(s):     1,3,5,7,9,11,13,15,17,19,21,23,25,27,29,31
```
