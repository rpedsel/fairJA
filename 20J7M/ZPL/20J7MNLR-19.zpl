set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 21.8595, <2> 27.0143, <3> 25.2979, <4> 26.5792, <5> 29.7536, <6> 22.7457, <7> 29.9898, <8> 20.3365, <9> 25.5414, <10> 33.0668, <11> 27.6388, <12> 31.0435, <13> 26.5572, <14> 17.4566, <15> 29.9716, <16> 24.4916, <17> 34.2472, <18> 32.8685, <19> 30.447, <20> 33.3193;
param workload[JOB] := <1> 3.2879, <2> 47.6915, <3> 8.9961, <4> 38.919, <5> 31.1866, <6> 11.5234, <7> 19.9889, <8> 32.3705, <9> 37.4448, <10> 48.0838, <11> 32.8728, <12> 38.8875, <13> 4.574, <14> 8.4313, <15> 32.1134, <16> 9.2852, <17> 9.4831, <18> 43.6, <19> 0.7418, <20> 3.3392;
param capacity[MACHINE] := <1> 66.1173, <2> 66.1173, <3> 66.1173, <4> 66.1173, <5> 66.1173, <6> 66.1173, <7> 66.1173;

var x[JM];
var z;
maximize minBenefit: z;
subto Z:
   forall <m> in MACHINE do
      sum <j> in JOB : benefit[j] * x[j,m] >= z;
subto K:
   forall <m> in MACHINE do
      sum <j> in JOB : workload[j] * x[j,m] <= capacity[m];
subto X:
   forall <j> in JOB do
      sum <m> in MACHINE : x[j,m] <= 1;
subto A:
   forall <j,m> in JM do
      x[j,m] >= 0;
