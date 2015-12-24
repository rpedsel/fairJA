set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 36.622, <2> 45.9384, <3> 15.2723, <4> 6.9562, <5> 28.768, <6> 45.5626, <7> 34.5542, <8> 7.109, <9> 15.525, <10> 30.0574;
param workload[JOB] := <1> 6.0516, <2> 6.7778, <3> 3.908, <4> 2.6375, <5> 5.3636, <6> 6.75, <7> 5.8783, <8> 2.6663, <9> 3.9402, <10> 5.4825;
param capacity[MACHINE] := <1> 16.4853, <2> 16.4853, <3> 16.4853;

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
