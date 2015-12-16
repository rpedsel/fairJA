set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 27.9825, <2> 17.5175, <3> 18.5969, <4> 21.1015, <5> 24.3429, <6> 21.0985, <7> 29.4659, <8> 22.6719, <9> 24.6681, <10> 25.3968;
param workload[JOB] := <1> 5.2898, <2> 4.1854, <3> 4.3124, <4> 4.5936, <5> 4.9339, <6> 4.5933, <7> 5.4283, <8> 4.7615, <9> 4.9667, <10> 5.0395;
param capacity[MACHINE] := <1> 12.0261, <2> 12.0261, <3> 12.0261;

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
