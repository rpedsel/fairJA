set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 38.3903, <2> 32.8241, <3> 7.6998, <4> 11.18, <5> 26.7427, <6> 44.2786, <7> 6.7919, <8> 8.5794, <9> 23.99, <10> 27.7637;
param workload[JOB] := <1> 1473.8151, <2> 1077.4215, <3> 59.2869, <4> 124.9924, <5> 715.172, <6> 1960.5944, <7> 46.1299, <8> 73.6061, <9> 575.5201, <10> 770.823;
param capacity[MACHINE] := <1> 2292.4538, <2> 2292.4538, <3> 2292.4538;

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
