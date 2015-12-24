set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 26.1485, <2> 10.0174, <3> 25.6499, <4> 12.5734, <5> 27.0859, <6> 22.5558, <7> 22.0272, <8> 43.2563, <9> 38.2597, <10> 37.7125;
param workload[JOB] := <1> 26.1485, <2> 10.0174, <3> 25.6499, <4> 12.5734, <5> 27.0859, <6> 22.5558, <7> 22.0272, <8> 43.2563, <9> 38.2597, <10> 37.7125;
param capacity[MACHINE] := <1> 265.2866, <2> 265.2866, <3> 265.2866;

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
