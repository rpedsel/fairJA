set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 10.8373, <2> 4.7968, <3> 3.5819, <4> 29.7648, <5> 40.9072, <6> 11.9502, <7> 30.3812, <8> 2.229, <9> 22.9936, <10> 22.2537;
param workload[JOB] := <1> 3.292, <2> 2.1902, <3> 1.8926, <4> 5.4557, <5> 6.3959, <6> 3.4569, <7> 5.5119, <8> 1.493, <9> 4.7952, <10> 4.7174;
param capacity[MACHINE] := <1> 9.8002, <2> 9.8002, <3> 9.8002;

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
