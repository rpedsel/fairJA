set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 15.9115, <2> 47.3981, <3> 9.7022, <4> 23.5599, <5> 10.3104, <6> 31.5146, <7> 12.3408, <8> 39.0563, <9> 18.05, <10> 10.3521;
param workload[JOB] := <1> 3.9889, <2> 6.8846, <3> 3.1148, <4> 4.8539, <5> 3.211, <6> 5.6138, <7> 3.5129, <8> 6.2495, <9> 4.2485, <10> 3.2175;
param capacity[MACHINE] := <1> 11.2238, <2> 11.2238, <3> 11.2238;

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
