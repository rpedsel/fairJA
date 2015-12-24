set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 25.721, <2> 24.2316, <3> 28.8627, <4> 26.4057, <5> 22.9871, <6> 22.5282, <7> 19.9335, <8> 26.9285, <9> 26.129, <10> 30.4941;
param workload[JOB] := <1> 661.5698, <2> 587.1704, <3> 833.0555, <4> 697.261, <5> 528.4068, <6> 507.5198, <7> 397.3444, <8> 725.1441, <9> 682.7246, <10> 929.8901;
param capacity[MACHINE] := <1> 2183.3622, <2> 2183.3622, <3> 2183.3622;

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
