set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 25.3314, <2> 27.9409, <3> 19.6412, <4> 21.126, <5> 23.3764, <6> 25.4344, <7> 25.2251, <8> 18.95, <9> 31.1102, <10> 23.6863;
param workload[JOB] := <1> 4.2341, <2> 47.7426, <3> 13.3865, <4> 4.8536, <5> 20.8162, <6> 9.0888, <7> 29.654, <8> 37.4155, <9> 34.0228, <10> 10.0744;
param capacity[MACHINE] := <1> 211.2885, <2> 211.2885, <3> 211.2885;

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
