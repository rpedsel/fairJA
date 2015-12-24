set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 23.6683, <2> 30.8343, <3> 31.662, <4> 24.3526, <5> 28.458, <6> 22.6012, <7> 28.189, <8> 19.5279, <9> 19.6484, <10> 36.0231;
param workload[JOB] := <1> 4.865, <2> 5.5529, <3> 5.6269, <4> 4.9348, <5> 5.3346, <6> 4.7541, <7> 5.3093, <8> 4.419, <9> 4.4327, <10> 6.0019;
param capacity[MACHINE] := <1> 51.2312, <2> 51.2312, <3> 51.2312;

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
