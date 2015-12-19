set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 23.3706, <2> 17.3741, <3> 24.0037, <4> 16.0478, <5> 23.7408, <6> 29.5174, <7> 28.7142, <8> 25.5532, <9> 23.7198, <10> 28.8061;
param workload[JOB] := <1> 23.3706, <2> 17.3741, <3> 24.0037, <4> 16.0478, <5> 23.7408, <6> 29.5174, <7> 28.7142, <8> 25.5532, <9> 23.7198, <10> 28.8061;
param capacity[MACHINE] := <1> 60.212, <2> 60.212, <3> 60.212;

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
