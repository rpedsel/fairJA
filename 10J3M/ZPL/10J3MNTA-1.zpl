set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 29.6456, <2> 25.587, <3> 26.0674, <4> 31.289, <5> 28.5248, <6> 24.4221, <7> 22.285, <8> 29.1958, <9> 25.6397, <10> 29.9423;
param workload[JOB] := <1> 878.8616, <2> 654.6946, <3> 679.5093, <4> 979.0015, <5> 813.6642, <6> 596.439, <7> 496.6212, <8> 852.3947, <9> 657.3942, <10> 896.5413;
param capacity[MACHINE] := <1> 1876.2804, <2> 1876.2804, <3> 1876.2804;

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
