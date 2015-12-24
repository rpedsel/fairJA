set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 15.079, <2> 12.0432, <3> 49.7104, <4> 33.4258, <5> 20.067, <6> 39.0865, <7> 47.2351, <8> 49.9306, <9> 11.2631, <10> 41.3677;
param workload[JOB] := <1> 3.8832, <2> 3.4703, <3> 7.0506, <4> 5.7815, <5> 4.4796, <6> 6.2519, <7> 6.8728, <8> 7.0662, <9> 3.3561, <10> 6.4318;
param capacity[MACHINE] := <1> 13.661, <2> 13.661, <3> 13.661;

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
