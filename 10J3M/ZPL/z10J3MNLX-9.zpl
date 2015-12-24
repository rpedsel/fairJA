set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 26.1907, <2> 30.0321, <3> 30.6403, <4> 28.4303, <5> 21.6177, <6> 24.8225, <7> 28.656, <8> 23.2651, <9> 27.8179, <10> 24.3828;
param workload[JOB] := <1> 5.1177, <2> 5.4802, <3> 5.5354, <4> 5.332, <5> 4.6495, <6> 4.9822, <7> 5.3531, <8> 4.8234, <9> 5.2743, <10> 4.9379;
param capacity[MACHINE] := <1> 17.1619, <2> 17.1619, <3> 17.1619;

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
