set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 21.3801, <2> 25.5723, <3> 4.1864, <4> 17.2788, <5> 45.6787, <6> 38.2224, <7> 1.6103, <8> 1.6812, <9> 43.4625, <10> 6.8675;
param workload[JOB] := <1> 457.1087, <2> 653.9425, <3> 17.5259, <4> 298.5569, <5> 2086.5436, <6> 1460.9519, <7> 2.5931, <8> 2.8264, <9> 1888.9889, <10> 47.1626;
param capacity[MACHINE] := <1> 6916.2005, <2> 6916.2005, <3> 6916.2005;

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
