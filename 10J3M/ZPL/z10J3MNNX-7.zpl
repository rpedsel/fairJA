set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 23.0166, <2> 28.3428, <3> 25.5972, <4> 28.1425, <5> 29.7352, <6> 26.7754, <7> 27.2258, <8> 14.3678, <9> 23.7226, <10> 31.6278;
param workload[JOB] := <1> 4.7976, <2> 5.3238, <3> 5.0594, <4> 5.305, <5> 5.453, <6> 5.1745, <7> 5.2178, <8> 3.7905, <9> 4.8706, <10> 5.6239;
param capacity[MACHINE] := <1> 50.6161, <2> 50.6161, <3> 50.6161;

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
