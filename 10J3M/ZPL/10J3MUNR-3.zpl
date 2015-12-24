set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 48.7029, <2> 4.894, <3> 7.7164, <4> 31.4092, <5> 30.1087, <6> 31.4845, <7> 26.8052, <8> 42.6018, <9> 3.6131, <10> 13.487;
param workload[JOB] := <1> 10.2094, <2> 45.6279, <3> 13.2212, <4> 8.5511, <5> 22.8551, <6> 16.6241, <7> 7.5935, <8> 35.3295, <9> 22.9287, <10> 46.5609;
param capacity[MACHINE] := <1> 229.5014, <2> 229.5014, <3> 229.5014;

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
