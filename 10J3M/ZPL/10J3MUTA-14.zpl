set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 29.0679, <2> 1.4472, <3> 28.5757, <4> 49.6229, <5> 4.2257, <6> 17.2989, <7> 49.6496, <8> 13.6638, <9> 7.4002, <10> 29.1649;
param workload[JOB] := <1> 844.9428, <2> 2.0944, <3> 816.5706, <4> 2462.4322, <5> 17.8565, <6> 299.2519, <7> 2465.0828, <8> 186.6994, <9> 54.763, <10> 850.5914;
param capacity[MACHINE] := <1> 2000.0713, <2> 2000.0713, <3> 2000.0713;

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
