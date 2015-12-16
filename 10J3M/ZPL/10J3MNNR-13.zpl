set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 23.0023, <2> 29.8046, <3> 17.3398, <4> 28.3469, <5> 32.9639, <6> 27.0047, <7> 16.3517, <8> 24.7148, <9> 26.4885, <10> 21.4845;
param workload[JOB] := <1> 4.9706, <2> 3.7381, <3> 45.0841, <4> 35.6188, <5> 39.3562, <6> 10.7662, <7> 29.7056, <8> 26.4156, <9> 24.7638, <10> 37.7268;
param capacity[MACHINE] := <1> 258.1458, <2> 258.1458, <3> 258.1458;

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
