set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 27.0552, <2> 26.0028, <3> 6.4921, <4> 6.1307, <5> 32.6586, <6> 33.8308, <7> 2.4101, <8> 16.4498, <9> 8.2393, <10> 15.4575;
param workload[JOB] := <1> 41.3446, <2> 4.8083, <3> 15.1185, <4> 14.0732, <5> 40.194, <6> 14.5119, <7> 21.2883, <8> 28.8614, <9> 20.5848, <10> 1.0951;
param capacity[MACHINE] := <1> 67.2934, <2> 67.2934, <3> 67.2934;

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
