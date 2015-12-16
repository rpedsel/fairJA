set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 23.8909, <2> 29.522, <3> 29.6572, <4> 13.8076, <5> 21.1066, <6> 25.8849, <7> 19.7374, <8> 13.7342, <9> 13.9478, <10> 24.3602;
param workload[JOB] := <1> 570.7751, <2> 871.5485, <3> 879.5495, <4> 190.6498, <5> 445.4886, <6> 670.028, <7> 389.565, <8> 188.6282, <9> 194.5411, <10> 593.4193;
param capacity[MACHINE] := <1> 1248.5483, <2> 1248.5483, <3> 1248.5483;

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
