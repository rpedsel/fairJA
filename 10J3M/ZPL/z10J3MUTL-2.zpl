set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 24.1539, <2> 4.4041, <3> 47.5772, <4> 28.4827, <5> 38.6683, <6> 10.7054, <7> 45.0538, <8> 43.0446, <9> 14.1611, <10> 9.0194;
param workload[JOB] := <1> 24.1539, <2> 4.4041, <3> 47.5772, <4> 28.4827, <5> 38.6683, <6> 10.7054, <7> 45.0538, <8> 43.0446, <9> 14.1611, <10> 9.0194;
param capacity[MACHINE] := <1> 66.3176, <2> 66.3176, <3> 66.3176;

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
