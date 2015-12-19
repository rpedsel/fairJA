set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 28.9845, <2> 46.1338, <3> 3.6109, <4> 0.3935, <5> 47.6997, <6> 8.7527, <7> 33.6485, <8> 39.9121, <9> 1.3238, <10> 16.2458;
param workload[JOB] := <1> 5.3837, <2> 6.7922, <3> 1.9002, <4> 0.6273, <5> 6.9065, <6> 2.9585, <7> 5.8007, <8> 6.3176, <9> 1.1506, <10> 4.0306;
param capacity[MACHINE] := <1> 10.467, <2> 10.467, <3> 10.467;

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
