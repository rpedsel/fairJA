set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 44.4304, <2> 23.1052, <3> 32.2426, <4> 20.5842, <5> 19.8264, <6> 7.9356, <7> 5.72, <8> 47.2094, <9> 36.5858, <10> 28.052;
param workload[JOB] := <1> 6.6656, <2> 4.8068, <3> 5.6783, <4> 4.537, <5> 4.4527, <6> 2.817, <7> 2.3917, <8> 6.8709, <9> 6.0486, <10> 5.2964;
param capacity[MACHINE] := <1> 16.5217, <2> 16.5217, <3> 16.5217;

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
