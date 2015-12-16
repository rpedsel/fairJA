set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 25.6525, <2> 20.3603, <3> 24.0769, <4> 20.2844, <5> 36.947, <6> 28.5724, <7> 23.502, <8> 20.0295, <9> 21.3107, <10> 18.0028;
param workload[JOB] := <1> 25.6525, <2> 20.3603, <3> 24.0769, <4> 20.2844, <5> 36.947, <6> 28.5724, <7> 23.502, <8> 20.0295, <9> 21.3107, <10> 18.0028;
param capacity[MACHINE] := <1> 59.6846, <2> 59.6846, <3> 59.6846;

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
