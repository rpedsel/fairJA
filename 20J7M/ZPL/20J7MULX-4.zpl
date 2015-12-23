set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 32.071, <2> 41.1425, <3> 0.5828, <4> 17.9967, <5> 23.2897, <6> 48.1947, <7> 9.0971, <8> 28.563, <9> 31.6585, <10> 43.2735, <11> 45.1736, <12> 41.0021, <13> 3.5489, <14> 16.3496, <15> 1.0106, <16> 41.2881, <17> 11.7404, <18> 2.0875, <19> 1.4072, <20> 41.2742;
param workload[JOB] := <1> 5.6631, <2> 6.4142, <3> 0.7634, <4> 4.2423, <5> 4.8259, <6> 6.9422, <7> 3.0161, <8> 5.3444, <9> 5.6266, <10> 6.5783, <11> 6.7211, <12> 6.4033, <13> 1.8839, <14> 4.0435, <15> 1.0053, <16> 6.4256, <17> 3.4264, <18> 1.4448, <19> 1.1863, <20> 6.4245;
param capacity[MACHINE] := <1> 12.6259, <2> 12.6259, <3> 12.6259, <4> 12.6259, <5> 12.6259, <6> 12.6259, <7> 12.6259;

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
