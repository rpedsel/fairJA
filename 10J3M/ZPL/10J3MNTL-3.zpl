set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 25.9672, <2> 32.1774, <3> 16.9345, <4> 25.8591, <5> 28.0172, <6> 29.7274, <7> 23.5643, <8> 24.6116, <9> 26.1117, <10> 18.707;
param workload[JOB] := <1> 25.9672, <2> 32.1774, <3> 16.9345, <4> 25.8591, <5> 28.0172, <6> 29.7274, <7> 23.5643, <8> 24.6116, <9> 26.1117, <10> 18.707;
param capacity[MACHINE] := <1> 62.9194, <2> 62.9194, <3> 62.9194;

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
