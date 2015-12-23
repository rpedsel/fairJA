set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 30.6503, <2> 18.9881, <3> 8.5893, <4> 35.3287, <5> 16.4737, <6> 39.3022, <7> 38.235, <8> 2.0256, <9> 49.251, <10> 24.389, <11> 43.4559, <12> 32.4575, <13> 46.0267, <14> 10.7745, <15> 28.033, <16> 19.2649, <17> 0.6562, <18> 38.6707, <19> 15.0091, <20> 20.9364;
param workload[JOB] := <1> 30.6503, <2> 18.9881, <3> 8.5893, <4> 35.3287, <5> 16.4737, <6> 39.3022, <7> 38.235, <8> 2.0256, <9> 49.251, <10> 24.389, <11> 43.4559, <12> 32.4575, <13> 46.0267, <14> 10.7745, <15> 28.033, <16> 19.2649, <17> 0.6562, <18> 38.6707, <19> 15.0091, <20> 20.9364;
param capacity[MACHINE] := <1> 55.5555, <2> 55.5555, <3> 55.5555, <4> 55.5555, <5> 55.5555, <6> 55.5555, <7> 55.5555;

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
