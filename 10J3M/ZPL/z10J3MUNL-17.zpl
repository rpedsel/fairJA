set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 29.434, <2> 13.6545, <3> 11.7897, <4> 26.6563, <5> 2.4899, <6> 35.2069, <7> 39.7872, <8> 37.3811, <9> 36.7037, <10> 10.91;
param workload[JOB] := <1> 29.434, <2> 13.6545, <3> 11.7897, <4> 26.6563, <5> 2.4899, <6> 35.2069, <7> 39.7872, <8> 37.3811, <9> 36.7037, <10> 10.91;
param capacity[MACHINE] := <1> 244.0133, <2> 244.0133, <3> 244.0133;

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
