set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 9.479, <2> 30.6605, <3> 43.3198, <4> 13.7119, <5> 21.3548, <6> 0.8823, <7> 30.0953, <8> 47.1777, <9> 37.0687, <10> 21.3105;
param workload[JOB] := <1> 44.2639, <2> 10.5464, <3> 23.5602, <4> 30.8632, <5> 29.574, <6> 17.1406, <7> 13.5478, <8> 25.5549, <9> 23.3564, <10> 40.648;
param capacity[MACHINE] := <1> 64.7638, <2> 64.7638, <3> 64.7638;

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
