set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 20.1538, <2> 31.3106, <3> 20.1684, <4> 27.9114, <5> 17.9623, <6> 25.0771, <7> 24.2802, <8> 21.2614, <9> 27.5196, <10> 28.8642;
param workload[JOB] := <1> 20.1538, <2> 31.3106, <3> 20.1684, <4> 27.9114, <5> 17.9623, <6> 25.0771, <7> 24.2802, <8> 21.2614, <9> 27.5196, <10> 28.8642;
param capacity[MACHINE] := <1> 61.1273, <2> 61.1273, <3> 61.1273;

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
