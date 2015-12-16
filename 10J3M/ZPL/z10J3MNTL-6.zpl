set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 24.7292, <2> 12.6751, <3> 15.966, <4> 25.7978, <5> 27.4403, <6> 25.0136, <7> 22.6685, <8> 17.9332, <9> 20.5971, <10> 22.846;
param workload[JOB] := <1> 24.7292, <2> 12.6751, <3> 15.966, <4> 25.7978, <5> 27.4403, <6> 25.0136, <7> 22.6685, <8> 17.9332, <9> 20.5971, <10> 22.846;
param capacity[MACHINE] := <1> 53.9167, <2> 53.9167, <3> 53.9167;

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
