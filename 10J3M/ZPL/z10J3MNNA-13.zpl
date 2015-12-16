set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 21.4159, <2> 24.5764, <3> 21.481, <4> 29.6239, <5> 21.4481, <6> 25.8992, <7> 25.7084, <8> 30.4489, <9> 22.7562, <10> 29.4784;
param workload[JOB] := <1> 458.6408, <2> 603.9994, <3> 461.4334, <4> 877.5755, <5> 460.021, <6> 670.7686, <7> 660.9218, <8> 927.1355, <9> 517.8446, <10> 868.9761;
param capacity[MACHINE] := <1> 6507.3167, <2> 6507.3167, <3> 6507.3167;

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
