set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 13.6075, <2> 25.6979, <3> 17.2861, <4> 49.9783, <5> 29.7977, <6> 31.5253, <7> 22.6483, <8> 15.7845, <9> 10.2225, <10> 5.0488;
param workload[JOB] := <1> 3.6888, <2> 5.0693, <3> 4.1577, <4> 7.0695, <5> 5.4587, <6> 5.6147, <7> 4.759, <8> 3.973, <9> 3.1973, <10> 2.247;
param capacity[MACHINE] := <1> 11.3087, <2> 11.3087, <3> 11.3087;

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
