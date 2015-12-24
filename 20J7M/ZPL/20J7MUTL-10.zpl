set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 39.1511, <2> 2.3611, <3> 33.5526, <4> 25.7842, <5> 16.4716, <6> 37.617, <7> 4.0706, <8> 41.4425, <9> 49.6118, <10> 8.1188, <11> 36.1639, <12> 49.1885, <13> 11.2258, <14> 8.3107, <15> 23.1102, <16> 29.3757, <17> 43.8468, <18> 46.7188, <19> 21.9564, <20> 45.8534;
param workload[JOB] := <1> 39.1511, <2> 2.3611, <3> 33.5526, <4> 25.7842, <5> 16.4716, <6> 37.617, <7> 4.0706, <8> 41.4425, <9> 49.6118, <10> 8.1188, <11> 36.1639, <12> 49.1885, <13> 11.2258, <14> 8.3107, <15> 23.1102, <16> 29.3757, <17> 43.8468, <18> 46.7188, <19> 21.9564, <20> 45.8534;
param capacity[MACHINE] := <1> 61.4926, <2> 61.4926, <3> 61.4926, <4> 61.4926, <5> 61.4926, <6> 61.4926, <7> 61.4926;

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
