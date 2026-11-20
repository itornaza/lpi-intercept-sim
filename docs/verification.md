# Verification record

**115 values compared, 0 mismatches.**

Every saved run in `examples/` was replayed through the 2008 sources with
GNU Octave, version 9.4.0 (`python3 tools/verify.py`) and compared with the values recorded in
`examples/expected/`. Each row shows the recorded value; a mismatch would show the replay
value next to it.

The PGi sweep uses no random numbers, so its result can also be checked against the console
output kept from the original 2008 MATLAB run of the same inputs: `The LPI wins 62.220000%`,
`The Interceptor wins 37.780000%`. The replay prints exactly the same two lines.

## pgi-sweep (seed 2008)

Typed inputs: `0 3 10 5 3 10 0.001`

| Value | Recorded | Replay | Match |
|---|---|---|---|
| comparisons | 10000 | 10000 | yes |
| input_function | 3 | 3 | yes |
| interceptor_wins_percent | 37.780000 | 37.780000 | yes |
| lpi_wins | 6222 | 6222 | yes |
| lpi_wins_percent | 62.220000 | 62.220000 | yes |
| p_intercept_t1 | 4.801933e-04 | 4.801933e-04 | yes |
| p_intercept_t10 | 3.478391e-03 | 3.478391e-03 | yes |
| p_intercept_t100 | 3.218081e-02 | 3.218081e-02 | yes |
| p_intercept_t1000 | 2.221578e-01 | 2.221578e-01 | yes |
| p_intercept_t10000 | 3.777466e-01 | 3.777466e-01 | yes |
| p_mainlobe_t1 | 1.271025e-03 | 1.271025e-03 | yes |
| p_mainlobe_t10 | 9.206965e-03 | 9.206965e-03 | yes |
| p_mainlobe_t100 | 8.517948e-02 | 8.517948e-02 | yes |
| p_mainlobe_t1000 | 5.880302e-01 | 5.880302e-01 | yes |
| p_mainlobe_t10000 | 9.998587e-01 | 9.998587e-01 | yes |
| pgi_crossover | 6.222623e-03 | 6.222623e-03 | yes |
| ratio_max | 2.494328e+03 | 2.494328e+03 | yes |
| ratio_median | 1.115497e+00 | 1.115497e+00 | yes |
| ratio_min | 7.887757e-01 | 7.887757e-01 | yes |
| seed | 2008 | 2008 | yes |

## all-random-seed1 (seed 1)

Typed inputs: `0 2 10 3 5 10 0.001`

| Value | Recorded | Replay | Match |
|---|---|---|---|
| comparisons | 10000 | 10000 | yes |
| input_function | 2 | 2 | yes |
| interceptor_wins_percent | 100.000000 | 100.000000 | yes |
| lpi_wins | 0 | 0 | yes |
| lpi_wins_percent | 0.000000 | 0.000000 | yes |
| p_intercept_t1 | 1.116224e-03 | 1.116224e-03 | yes |
| p_intercept_t10 | 9.047889e-03 | 9.047889e-03 | yes |
| p_intercept_t100 | 8.498177e-02 | 8.498177e-02 | yes |
| p_intercept_t1000 | 5.877122e-01 | 5.877122e-01 | yes |
| p_intercept_t10000 | 9.998578e-01 | 9.998578e-01 | yes |
| p_mainlobe_t1 | 1.116224e-03 | 1.116224e-03 | yes |
| p_mainlobe_t10 | 9.047889e-03 | 9.047889e-03 | yes |
| p_mainlobe_t100 | 8.498177e-02 | 8.498177e-02 | yes |
| p_mainlobe_t1000 | 5.877122e-01 | 5.877122e-01 | yes |
| p_mainlobe_t10000 | 9.998578e-01 | 9.998578e-01 | yes |
| ratio_max | 6.796035e-01 | 6.796035e-01 | yes |
| ratio_median | 3.836983e-03 | 3.836983e-03 | yes |
| ratio_min | 1.489948e-05 | 1.489948e-05 | yes |
| seed | 1 | 1 | yes |

## all-random-seed2 (seed 2)

Typed inputs: `0 2 10 3 5 10 0.001`

| Value | Recorded | Replay | Match |
|---|---|---|---|
| comparisons | 10000 | 10000 | yes |
| input_function | 2 | 2 | yes |
| interceptor_wins_percent | 99.990000 | 99.990000 | yes |
| lpi_wins | 1 | 1 | yes |
| lpi_wins_percent | 0.010000 | 0.010000 | yes |
| p_intercept_t1 | 1.116113e-03 | 1.116113e-03 | yes |
| p_intercept_t10 | 9.046984e-03 | 9.046984e-03 | yes |
| p_intercept_t100 | 8.497327e-02 | 8.497327e-02 | yes |
| p_intercept_t1000 | 5.876534e-01 | 5.876534e-01 | yes |
| p_intercept_t10000 | 9.997578e-01 | 9.997578e-01 | yes |
| p_mainlobe_t1 | 1.116224e-03 | 1.116224e-03 | yes |
| p_mainlobe_t10 | 9.047889e-03 | 9.047889e-03 | yes |
| p_mainlobe_t100 | 8.498177e-02 | 8.498177e-02 | yes |
| p_mainlobe_t1000 | 5.877122e-01 | 5.877122e-01 | yes |
| p_mainlobe_t10000 | 9.998578e-01 | 9.998578e-01 | yes |
| ratio_max | 2.695641e+00 | 2.695641e+00 | yes |
| ratio_median | 3.891188e-03 | 3.891188e-03 | yes |
| ratio_min | 4.791678e-06 | 4.791678e-06 | yes |
| seed | 2 | 2 | yes |

## all-random-seed3 (seed 3)

Typed inputs: `0 2 10 3 5 10 0.001`

| Value | Recorded | Replay | Match |
|---|---|---|---|
| comparisons | 10000 | 10000 | yes |
| input_function | 2 | 2 | yes |
| interceptor_wins_percent | 99.970000 | 99.970000 | yes |
| lpi_wins | 3 | 3 | yes |
| lpi_wins_percent | 0.030000 | 0.030000 | yes |
| p_intercept_t1 | 1.115889e-03 | 1.115889e-03 | yes |
| p_intercept_t10 | 9.045175e-03 | 9.045175e-03 | yes |
| p_intercept_t100 | 8.495628e-02 | 8.495628e-02 | yes |
| p_intercept_t1000 | 5.875358e-01 | 5.875358e-01 | yes |
| p_intercept_t10000 | 9.995578e-01 | 9.995578e-01 | yes |
| p_mainlobe_t1 | 1.116224e-03 | 1.116224e-03 | yes |
| p_mainlobe_t10 | 9.047889e-03 | 9.047889e-03 | yes |
| p_mainlobe_t100 | 8.498177e-02 | 8.498177e-02 | yes |
| p_mainlobe_t1000 | 5.877122e-01 | 5.877122e-01 | yes |
| p_mainlobe_t10000 | 9.998578e-01 | 9.998578e-01 | yes |
| ratio_max | 4.179898e+00 | 4.179898e+00 | yes |
| ratio_median | 3.875443e-03 | 3.875443e-03 | yes |
| ratio_min | 8.846477e-06 | 8.846477e-06 | yes |
| seed | 3 | 3 | yes |

## all-random-seed4 (seed 4)

Typed inputs: `0 2 10 3 5 10 0.001`

| Value | Recorded | Replay | Match |
|---|---|---|---|
| comparisons | 10000 | 10000 | yes |
| input_function | 2 | 2 | yes |
| interceptor_wins_percent | 100.000000 | 100.000000 | yes |
| lpi_wins | 0 | 0 | yes |
| lpi_wins_percent | 0.000000 | 0.000000 | yes |
| p_intercept_t1 | 1.116224e-03 | 1.116224e-03 | yes |
| p_intercept_t10 | 9.047889e-03 | 9.047889e-03 | yes |
| p_intercept_t100 | 8.498177e-02 | 8.498177e-02 | yes |
| p_intercept_t1000 | 5.877122e-01 | 5.877122e-01 | yes |
| p_intercept_t10000 | 9.998578e-01 | 9.998578e-01 | yes |
| p_mainlobe_t1 | 1.116224e-03 | 1.116224e-03 | yes |
| p_mainlobe_t10 | 9.047889e-03 | 9.047889e-03 | yes |
| p_mainlobe_t100 | 8.498177e-02 | 8.498177e-02 | yes |
| p_mainlobe_t1000 | 5.877122e-01 | 5.877122e-01 | yes |
| p_mainlobe_t10000 | 9.998578e-01 | 9.998578e-01 | yes |
| ratio_max | 4.752147e-01 | 4.752147e-01 | yes |
| ratio_median | 3.861881e-03 | 3.861881e-03 | yes |
| ratio_min | 9.971513e-06 | 9.971513e-06 | yes |
| seed | 4 | 4 | yes |

## all-random-seed5 (seed 5)

Typed inputs: `0 2 10 3 5 10 0.001`

| Value | Recorded | Replay | Match |
|---|---|---|---|
| comparisons | 10000 | 10000 | yes |
| input_function | 2 | 2 | yes |
| interceptor_wins_percent | 99.990000 | 99.990000 | yes |
| lpi_wins | 1 | 1 | yes |
| lpi_wins_percent | 0.010000 | 0.010000 | yes |
| p_intercept_t1 | 1.116113e-03 | 1.116113e-03 | yes |
| p_intercept_t10 | 9.046984e-03 | 9.046984e-03 | yes |
| p_intercept_t100 | 8.497327e-02 | 8.497327e-02 | yes |
| p_intercept_t1000 | 5.876534e-01 | 5.876534e-01 | yes |
| p_intercept_t10000 | 9.997578e-01 | 9.997578e-01 | yes |
| p_mainlobe_t1 | 1.116224e-03 | 1.116224e-03 | yes |
| p_mainlobe_t10 | 9.047889e-03 | 9.047889e-03 | yes |
| p_mainlobe_t100 | 8.498177e-02 | 8.498177e-02 | yes |
| p_mainlobe_t1000 | 5.877122e-01 | 5.877122e-01 | yes |
| p_mainlobe_t10000 | 9.998578e-01 | 9.998578e-01 | yes |
| ratio_max | 1.494706e+00 | 1.494706e+00 | yes |
| ratio_median | 3.877789e-03 | 3.877789e-03 | yes |
| ratio_min | 2.252219e-05 | 2.252219e-05 | yes |
| seed | 5 | 5 | yes |
