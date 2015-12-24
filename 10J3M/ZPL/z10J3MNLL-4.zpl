set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 33.1296, <2> 19.8157, <3> 31.0779, <4> 23.8757, <5> 26.5009, <6> 29.0942, <7> 24.5738, <8> 25.9078, <9> 24.5452, <10> 30.1412;
param workload[JOB] := <1> 33.1296, <2> 19.8157, <3> 31.0779, <4> 23.8757, <5> 26.5009, <6> 29.0942, <7> 24.5738, <8> 25.9078, <9> 24.5452, <10> 30.1412;
param capacity[MACHINE] := <1> 89.554, <2> 89.554, <3> 89.554;

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
