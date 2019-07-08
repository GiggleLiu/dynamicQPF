using Yao

using BenchmarkTools

entangler(nbit::Int, offset::Int) = chain(nbit, control(nbit, i+offset, mod(i+offset, nbit)+1=>X) for i=1:2:nbit)

function build_block(nbit::Int, theta::Real, trafie::Real)
    # entanglers
    entangler_A = entangler(nbit, 0) # |> cache
    entangler_B = entangler(nbit, 1)  #|> cache
    entangler_AB = chain(entangler_A, entangler_B)  #|> cache
    
    # rotations
    rz = Rz(theta)
    rx = Rx(trafie)
    rz_A = repeat(nbit, rz, 1:2:nbit)
    rz_B = repeat(nbit, rz, 2:2:nbit)
    rx_AB = repeat(nbit, rx, 1:nbit)
    
    chain(nbit, [entangler_A, rz_B, entangler_AB, rz_A, entangler_B, rx_AB])
end

"""
Run dymamical quantum phase transition program.

    * g: the factor before σx term.
    * tmax: maximum time.
    * nslice: number of slices that Trotter decoposition.
"""
function dynamical_qft(nbit::Int, g::Real, tmax::Real, nslice::Int)
    dt = tmax/nslice
    trafie = dt*g
    theta = -dt
    unit = build_block(nbit, theta, trafie)
    
    reg = zero_state(nbit)
    res = Float64[]
    for i in 1:nslice
        apply!(reg, unit)
        push!(res, expect(put(nbit, nbit÷2=>Z), reg))
    end
    res
end

nslice = 500
tmax = 10
#display(@benchmark dynamical_qft(10, 2.0, 10, 500))
display(@benchmark dynamical_qft(20, 2.0, 10, 500))
