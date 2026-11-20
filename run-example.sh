#!/usr/bin/env bash
# Replay a saved input file through the 2008 program in GNU Octave, without typing.
#
#   ./run-example.sh examples/pgi-sweep.txt                    # results only
#   ./run-example.sh examples/all-random.txt 7                 # random mode with RNG seed 7
#   ./run-example.sh examples/pgi-sweep.txt 2008 out           # also save the 3 figures as out-1.png ... out-3.png
#
# The input file holds exactly what a user would type at the prompts, one value per line.
# The seed (default 2008) fixes Octave's random number generator before the program starts,
# so the random mode gives the same numbers on every run.
set -euo pipefail
input="$(realpath "${1:?usage: $0 <input-file> [seed] [png-prefix]}")"
seed="${2:-2008}"
png="${3:+$(realpath -m "$3")}"
cd "$(dirname "$0")"
# Run headless: no display, so Octave draws with gnuplot and the figures are written to files.
LPI_SEED="$seed" LPI_PNG="$png" DISPLAY= octave-cli --no-gui --quiet --eval "
  warning('off', 'Octave:function-name-clash');  % parameters_1.m and parameters_3.m declare 'parameters'
  warning('off', 'Octave:gnuplot-graphics');
  graphics_toolkit('gnuplot');
  set(0, 'defaultfigurevisible', 'off');
  addpath('src');
  rand('state', str2double(getenv('LPI_SEED')));
  lpiInterceptSim;
  % ---- Batch summary, read from the workspace lpiInterceptSim.m leaves behind (not part of the 2008 program) ----
  if choice == 1
    n = 1;
  else
    n = NUMBER_OF_COMPARISSONS;
  end
  r = dependent_variable(1:n);
  fprintf('RESULT seed = %s\n', getenv('LPI_SEED'));
  fprintf('RESULT input_function = %d\n', choice);
  fprintf('RESULT comparisons = %d\n', n);
  fprintf('RESULT lpi_wins = %d\n', LPI_wins);
  fprintf('RESULT ratio_min = %.6e\n', min(r));
  fprintf('RESULT ratio_median = %.6e\n', median(r));
  fprintf('RESULT ratio_max = %.6e\n', max(r));
  if choice == 3
    k = find(r < 1, 1);
    if isempty(k)
      fprintf('RESULT pgi_crossover = none\n');
    else
      fprintf('RESULT pgi_crossover = %.6e\n', independent_variable(k));
    end
  end
  for t = [1 10 100 1000 10000]
    fprintf('RESULT p_mainlobe_t%d = %.6e\n', t, P_vector(t));
    fprintf('RESULT p_intercept_t%d = %.6e\n', t, P_vector(t) * (1 - LPI_wins / NUMBER_OF_COMPARISSONS));
  end
  png = getenv('LPI_PNG');
  if ~isempty(png)
    for f = 1:3
      figure(f);
      print(sprintf('%s-%d.png', png, f), '-dpng', '-S1000,700');
    end
    fprintf('Figures saved to %s-1.png ... %s-3.png\n', png, png);
  end
" < "$input"
