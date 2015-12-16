set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 28.0352, <2> 10.2802, <3> 26.5921, <4> 20.2492, <5> 22.3557, <6> 18.2953, <7> 24.2214, <8> 20.3654, <9> 12.2771, <10> 14.7825;
param workload[JOB] := <1> 785.9724, <2> 105.6825, <3> 707.1398, <4> 410.0301, <5> 499.7773, <6> 334.718, <7> 586.6762, <8> 414.7495, <9> 150.7272, <10> 218.5223;
param capacity[MACHINE] := <1> 1404.6651, <2> 1404.6651, <3> 1404.6651;

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
