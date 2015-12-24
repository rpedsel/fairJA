set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 0.2325, <2> 25.6228, <3> 36.5225, <4> 19.2398, <5> 2.6356, <6> 6.6445, <7> 45.9887, <8> 5.9151, <9> 49.0199, <10> 25.8555;
param workload[JOB] := <1> 27.7952, <2> 0.5391, <3> 34.6706, <4> 46.1526, <5> 42.2014, <6> 34.4482, <7> 30.1052, <8> 40.5253, <9> 15.8696, <10> 39.5131;
param capacity[MACHINE] := <1> 77.9551, <2> 77.9551, <3> 77.9551;

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
