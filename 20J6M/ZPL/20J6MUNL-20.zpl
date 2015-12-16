set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 40.782, <2> 11.1503, <3> 38.2098, <4> 8.0943, <5> 25.2438, <6> 37.3161, <7> 39.1066, <8> 25.212, <9> 41.5121, <10> 0.5453, <11> 6.5451, <12> 32.4303, <13> 7.645, <14> 40.7959, <15> 34.3331, <16> 48.7157, <17> 8.484, <18> 12.97, <19> 35.1844, <20> 34.9839;
param workload[JOB] := <1> 40.782, <2> 11.1503, <3> 38.2098, <4> 8.0943, <5> 25.2438, <6> 37.3161, <7> 39.1066, <8> 25.212, <9> 41.5121, <10> 0.5453, <11> 6.5451, <12> 32.4303, <13> 7.645, <14> 40.7959, <15> 34.3331, <16> 48.7157, <17> 8.484, <18> 12.97, <19> 35.1844, <20> 34.9839;
param capacity[MACHINE] := <1> 529.2597, <2> 529.2597, <3> 529.2597, <4> 529.2597, <5> 529.2597, <6> 529.2597;

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
