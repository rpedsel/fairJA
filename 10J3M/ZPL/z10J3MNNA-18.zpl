set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 35.0383, <2> 19.395, <3> 17.9505, <4> 29.0913, <5> 22.6792, <6> 22.0727, <7> 38.4701, <8> 26.7964, <9> 27.9623, <10> 28.0688;
param workload[JOB] := <1> 1227.6825, <2> 376.166, <3> 322.2205, <4> 846.3037, <5> 514.3461, <6> 487.2041, <7> 1479.9486, <8> 718.0471, <9> 781.8902, <10> 787.8575;
param capacity[MACHINE] := <1> 7541.6663, <2> 7541.6663, <3> 7541.6663;

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
