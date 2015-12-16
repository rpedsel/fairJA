set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 3.7579, <2> 47.3652, <3> 25.1487, <4> 1.966, <5> 39.2928, <6> 14.0424, <7> 1.8942, <8> 20.3787, <9> 26.8518, <10> 16.2087;
param workload[JOB] := <1> 14.1218, <2> 2243.4622, <3> 632.4571, <4> 3.8652, <5> 1543.9241, <6> 197.189, <7> 3.588, <8> 415.2914, <9> 721.0192, <10> 262.722;
param capacity[MACHINE] := <1> 2012.5467, <2> 2012.5467, <3> 2012.5467;

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
