set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 4.1982, <2> 25.9127, <3> 38.1945, <4> 22.5745, <5> 23.5048, <6> 11.0936, <7> 15.3388, <8> 40.9564, <9> 41.2217, <10> 8.581, <11> 41.4238, <12> 41.7912, <13> 11.4069, <14> 43.869, <15> 3.7464, <16> 11.8437, <17> 25.0968, <18> 44.805, <19> 34.8788, <20> 14.2657;
param workload[JOB] := <1> 4.1982, <2> 25.9127, <3> 38.1945, <4> 22.5745, <5> 23.5048, <6> 11.0936, <7> 15.3388, <8> 40.9564, <9> 41.2217, <10> 8.581, <11> 41.4238, <12> 41.7912, <13> 11.4069, <14> 43.869, <15> 3.7464, <16> 11.8437, <17> 25.0968, <18> 44.805, <19> 34.8788, <20> 14.2657;
param capacity[MACHINE] := <1> 54.0754, <2> 54.0754, <3> 54.0754, <4> 54.0754, <5> 54.0754, <6> 54.0754, <7> 54.0754;

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
