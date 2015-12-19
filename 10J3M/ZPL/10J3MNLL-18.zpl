set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 35.2186, <2> 34.6993, <3> 25.6493, <4> 23.6571, <5> 23.7325, <6> 29.5999, <7> 21.2886, <8> 28.5778, <9> 28.2777, <10> 17.7193;
param workload[JOB] := <1> 35.2186, <2> 34.6993, <3> 25.6493, <4> 23.6571, <5> 23.7325, <6> 29.5999, <7> 21.2886, <8> 28.5778, <9> 28.2777, <10> 17.7193;
param capacity[MACHINE] := <1> 89.4734, <2> 89.4734, <3> 89.4734;

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
