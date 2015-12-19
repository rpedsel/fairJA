set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 27.8403, <2> 24.3082, <3> 23.2388, <4> 20.0993, <5> 30.3439, <6> 21.7781, <7> 28.4735, <8> 25.6911, <9> 33.1847, <10> 25.6017;
param workload[JOB] := <1> 27.8403, <2> 24.3082, <3> 23.2388, <4> 20.0993, <5> 30.3439, <6> 21.7781, <7> 28.4735, <8> 25.6911, <9> 33.1847, <10> 25.6017;
param capacity[MACHINE] := <1> 86.8532, <2> 86.8532, <3> 86.8532;

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
