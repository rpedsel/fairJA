set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 26.751, <2> 20.3747, <3> 26.2326, <4> 11.817, <5> 21.7939, <6> 30.1616, <7> 14.9994, <8> 25.4169, <9> 24.3158, <10> 28.284;
param workload[JOB] := <1> 26.751, <2> 20.3747, <3> 26.2326, <4> 11.817, <5> 21.7939, <6> 30.1616, <7> 14.9994, <8> 25.4169, <9> 24.3158, <10> 28.284;
param capacity[MACHINE] := <1> 76.7156, <2> 76.7156, <3> 76.7156;

var x[JM];
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
