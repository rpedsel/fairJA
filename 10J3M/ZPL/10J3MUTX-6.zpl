set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 32.5053, <2> 9.6803, <3> 40.4825, <4> 22.0003, <5> 24.8852, <6> 13.9893, <7> 15.3763, <8> 6.2729, <9> 4.8705, <10> 8.4567;
param workload[JOB] := <1> 5.7013, <2> 3.1113, <3> 6.3626, <4> 4.6904, <5> 4.9885, <6> 3.7402, <7> 3.9213, <8> 2.5046, <9> 2.2069, <10> 2.908;
param capacity[MACHINE] := <1> 10.0338, <2> 10.0338, <3> 10.0338;

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
