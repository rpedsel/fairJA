set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 26.0964, <2> 24.111, <3> 33.2729, <4> 25.1456, <5> 27.3733, <6> 28.7395, <7> 15.4848, <8> 16.252, <9> 21.6882, <10> 16.6515;
param workload[JOB] := <1> 26.0964, <2> 24.111, <3> 33.2729, <4> 25.1456, <5> 27.3733, <6> 28.7395, <7> 15.4848, <8> 16.252, <9> 21.6882, <10> 16.6515;
param capacity[MACHINE] := <1> 78.2717, <2> 78.2717, <3> 78.2717;

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
