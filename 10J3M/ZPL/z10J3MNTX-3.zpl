set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 14.9965, <2> 25.7363, <3> 18.0603, <4> 29.7597, <5> 23.9489, <6> 23.1453, <7> 24.4273, <8> 24.134, <9> 27.7433, <10> 33.3062;
param workload[JOB] := <1> 3.8725, <2> 5.0731, <3> 4.2497, <4> 5.4552, <5> 4.8938, <6> 4.811, <7> 4.9424, <8> 4.9126, <9> 5.2672, <10> 5.7712;
param capacity[MACHINE] := <1> 12.3121, <2> 12.3121, <3> 12.3121;

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
