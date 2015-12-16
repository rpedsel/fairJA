set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 15.3855, <2> 40.2802, <3> 2.954, <4> 42.1462, <5> 27.2178, <6> 0.3447, <7> 13.2547, <8> 37.9518, <9> 40.714, <10> 7.7603, <11> 39.8422, <12> 27.4775, <13> 5.6049, <14> 39.2013, <15> 16.6814, <16> 27.3981, <17> 11.1073, <18> 7.1284, <19> 12.3982, <20> 10.0564;
param workload[JOB] := <1> 37.5322, <2> 11.7768, <3> 38.7351, <4> 41.0713, <5> 25.9144, <6> 36.788, <7> 28.6898, <8> 29.6025, <9> 6.5803, <10> 37.5973, <11> 45.1488, <12> 32.5611, <13> 33.6957, <14> 42.2681, <15> 28.2641, <16> 6.2364, <17> 15.8037, <18> 34.2706, <19> 22.1941, <20> 28.8034;
param capacity[MACHINE] := <1> 97.2556, <2> 97.2556, <3> 97.2556, <4> 97.2556, <5> 97.2556, <6> 97.2556;

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
