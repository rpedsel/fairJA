set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 49.2289, <2> 42.4193, <3> 28.3686, <4> 18.4414, <5> 26.0662, <6> 43.961, <7> 28.0299, <8> 39.4907, <9> 12.0651, <10> 13.111;
param workload[JOB] := <1> 31.5636, <2> 11.9895, <3> 49.4678, <4> 6.0234, <5> 17.4838, <6> 11.3128, <7> 37.484, <8> 43.5478, <9> 35.6424, <10> 39.4293;
param capacity[MACHINE] := <1> 70.9861, <2> 70.9861, <3> 70.9861;

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
