set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 10.9572, <2> 20.0047, <3> 2.6891, <4> 8.4431, <5> 11.8248, <6> 49.3834, <7> 6.9553, <8> 16.3129, <9> 31.1673, <10> 14.5112;
param workload[JOB] := <1> 10.9572, <2> 20.0047, <3> 2.6891, <4> 8.4431, <5> 11.8248, <6> 49.3834, <7> 6.9553, <8> 16.3129, <9> 31.1673, <10> 14.5112;
param capacity[MACHINE] := <1> 172.249, <2> 172.249, <3> 172.249;

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
