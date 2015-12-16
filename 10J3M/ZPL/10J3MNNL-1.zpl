set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 24.4264, <2> 16.0668, <3> 36.8386, <4> 31.9673, <5> 23.5105, <6> 28.7341, <7> 23.9403, <8> 28.739, <9> 24.8506, <10> 29.0586;
param workload[JOB] := <1> 24.4264, <2> 16.0668, <3> 36.8386, <4> 31.9673, <5> 23.5105, <6> 28.7341, <7> 23.9403, <8> 28.739, <9> 24.8506, <10> 29.0586;
param capacity[MACHINE] := <1> 268.1322, <2> 268.1322, <3> 268.1322;

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
