set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 29.1039, <2> 23.1928, <3> 17.8332, <4> 15.1185, <5> 15.3682, <6> 21.4672, <7> 11.4154, <8> 26.4785, <9> 24.3011, <10> 31.1981;
param workload[JOB] := <1> 847.037, <2> 537.906, <3> 318.023, <4> 228.569, <5> 236.1816, <6> 460.8407, <7> 130.3114, <8> 701.111, <9> 590.5435, <10> 973.3214;
param capacity[MACHINE] := <1> 1674.6149, <2> 1674.6149, <3> 1674.6149;

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
