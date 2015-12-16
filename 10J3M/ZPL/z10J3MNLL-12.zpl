set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 29.6212, <2> 27.2138, <3> 32.4438, <4> 17.6885, <5> 16.3078, <6> 12.1163, <7> 22.3762, <8> 29.5932, <9> 30.1847, <10> 17.0674;
param workload[JOB] := <1> 29.6212, <2> 27.2138, <3> 32.4438, <4> 17.6885, <5> 16.3078, <6> 12.1163, <7> 22.3762, <8> 29.5932, <9> 30.1847, <10> 17.0674;
param capacity[MACHINE] := <1> 78.2043, <2> 78.2043, <3> 78.2043;

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
