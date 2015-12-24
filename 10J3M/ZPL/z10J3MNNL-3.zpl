set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 28.4421, <2> 13.9904, <3> 31.441, <4> 22.0846, <5> 25.8034, <6> 31.6902, <7> 25.8293, <8> 16.8815, <9> 25.7213, <10> 23.3774;
param workload[JOB] := <1> 28.4421, <2> 13.9904, <3> 31.441, <4> 22.0846, <5> 25.8034, <6> 31.6902, <7> 25.8293, <8> 16.8815, <9> 25.7213, <10> 23.3774;
param capacity[MACHINE] := <1> 245.2612, <2> 245.2612, <3> 245.2612;

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
