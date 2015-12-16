set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 11.9214, <2> 12.8631, <3> 12.8018, <4> 26.5037, <5> 18.1177, <6> 25.5038, <7> 6.7065, <8> 43.1989, <9> 35.6177, <10> 39.6566;
param workload[JOB] := <1> 142.1198, <2> 165.4593, <3> 163.8861, <4> 702.4461, <5> 328.2511, <6> 650.4438, <7> 44.9771, <8> 1866.145, <9> 1268.6206, <10> 1572.6459;
param capacity[MACHINE] := <1> 1726.2487, <2> 1726.2487, <3> 1726.2487;

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
