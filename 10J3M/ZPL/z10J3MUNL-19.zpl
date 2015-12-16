set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 3.6651, <2> 38.7568, <3> 36.6973, <4> 33.2578, <5> 0.1481, <6> 29.1463, <7> 21.9037, <8> 35.3396, <9> 11.0755, <10> 44.6447;
param workload[JOB] := <1> 3.6651, <2> 38.7568, <3> 36.6973, <4> 33.2578, <5> 0.1481, <6> 29.1463, <7> 21.9037, <8> 35.3396, <9> 11.0755, <10> 44.6447;
param capacity[MACHINE] := <1> 254.6349, <2> 254.6349, <3> 254.6349;

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
