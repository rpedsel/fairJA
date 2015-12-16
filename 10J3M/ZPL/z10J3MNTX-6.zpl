set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 24.3462, <2> 29.7268, <3> 22.3643, <4> 19.7537, <5> 21.5727, <6> 20.1123, <7> 23.3632, <8> 28.5933, <9> 28.8153, <10> 27.5163;
param workload[JOB] := <1> 4.9342, <2> 5.4522, <3> 4.7291, <4> 4.4445, <5> 4.6446, <6> 4.4847, <7> 4.8335, <8> 5.3473, <9> 5.368, <10> 5.2456;
param capacity[MACHINE] := <1> 12.3709, <2> 12.3709, <3> 12.3709;

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
