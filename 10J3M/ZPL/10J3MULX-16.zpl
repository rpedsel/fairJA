set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 38.0558, <2> 48.3912, <3> 34.1754, <4> 8.3173, <5> 35.8109, <6> 15.594, <7> 8.2049, <8> 19.278, <9> 21.9253, <10> 24.0587;
param workload[JOB] := <1> 6.1689, <2> 6.9564, <3> 5.846, <4> 2.884, <5> 5.9842, <6> 3.9489, <7> 2.8644, <8> 4.3907, <9> 4.6824, <10> 4.905;
param capacity[MACHINE] := <1> 16.2103, <2> 16.2103, <3> 16.2103;

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
