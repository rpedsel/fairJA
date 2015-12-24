set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 28.0727, <2> 25.4258, <3> 20.0533, <4> 26.5859, <5> 20.4223, <6> 27.9832, <7> 23.9469, <8> 28.1908, <9> 28.32, <10> 19.7261;
param workload[JOB] := <1> 28.0727, <2> 25.4258, <3> 20.0533, <4> 26.5859, <5> 20.4223, <6> 27.9832, <7> 23.9469, <8> 28.1908, <9> 28.32, <10> 19.7261;
param capacity[MACHINE] := <1> 82.909, <2> 82.909, <3> 82.909;

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
