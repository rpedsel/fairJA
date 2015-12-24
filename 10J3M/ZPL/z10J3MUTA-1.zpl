set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 3.2538, <2> 28.4728, <3> 11.2598, <4> 12.9921, <5> 26.066, <6> 22.0523, <7> 28.7843, <8> 9.9364, <9> 30.2382, <10> 17.7304;
param workload[JOB] := <1> 10.5872, <2> 810.7003, <3> 126.7831, <4> 168.7947, <5> 679.4364, <6> 486.3039, <7> 828.5359, <8> 98.732, <9> 914.3487, <10> 314.3671;
param capacity[MACHINE] := <1> 1109.6473, <2> 1109.6473, <3> 1109.6473;

var x[JM] binary;
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
