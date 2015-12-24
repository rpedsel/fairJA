set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 23.4715, <2> 28.2259, <3> 18.5435, <4> 22.3792, <5> 17.3573, <6> 22.1732, <7> 16.9429, <8> 23.5548, <9> 29.9292, <10> 24.2311;
param workload[JOB] := <1> 550.9113, <2> 796.7014, <3> 343.8614, <4> 500.8286, <5> 301.2759, <6> 491.6508, <7> 287.0619, <8> 554.8286, <9> 895.757, <10> 587.1462;
param capacity[MACHINE] := <1> 1770.0077, <2> 1770.0077, <3> 1770.0077;

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
