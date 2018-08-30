# Simulating Dynamical Quantum Phase Transition

## Model Description
1D Hamiltonian with periodic boundary condition
$$ H(g) = -\sum_j \sigma_j^z\sigma_{j+1}^z + g\sigma_j^x $$

Using Trotter decomposition, build a circuit with 500 steps, dt = 0.02.

The circuit and results can be found in Ref. Hong 2018.

## Benchmark (single thread)
### Run benchmarks
```bash
$ cd src
$ julia dqpt_yao.jl
$ ipython dqpt_projectq.py
$ <run QtVM>
```

The running time

| Package  | 10 qubits | 20 qubits | 34 qubits |
| -------- | --------- | --------- | --------- |
| Yao      |           |           |           |
| QtVM     |           |           |           |
| ProjectQ |           |           |           |


## References
* Hong, Q., Ge, Z., Wang, W., Lang, H., Wang, Z., Chen, J., … Fan, H. (n.d.). A Universal Quantum Computing Virtual Machine, 1–10.
* https://github.com/QuantumBFS/Yao.jl
* https://github.com/ProjectQ-Framework/ProjectQ
