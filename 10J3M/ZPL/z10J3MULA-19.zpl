set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 34.2766, <2> 3.8717, <3> 31.9096, <4> 30.1833, <5> 20.8975, <6> 49.3879, <7> 9.256, <8> 23.1554, <9> 19.9172, <10> 42.1898;
param workload[JOB] := <1> 1174.8853, <2> 14.9901, <3> 1018.2226, <4> 911.0316, <5> 436.7055, <6> 2439.1647, <7> 85.6735, <8> 536.1725, <9> 396.6949, <10> 1779.9792;
param capacity[MACHINE] := <1> 2931.1733, <2> 2931.1733, <3> 2931.1733;

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
