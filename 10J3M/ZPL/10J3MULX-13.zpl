set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 2.1479, <2> 27.4705, <3> 36.1638, <4> 27.347, <5> 27.1409, <6> 25.7288, <7> 49.1739, <8> 28.0797, <9> 31.0413, <10> 37.4775;
param workload[JOB] := <1> 1.4656, <2> 5.2412, <3> 6.0136, <4> 5.2294, <5> 5.2097, <6> 5.0724, <7> 7.0124, <8> 5.299, <9> 5.5715, <10> 6.1219;
param capacity[MACHINE] := <1> 17.4122, <2> 17.4122, <3> 17.4122;

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
