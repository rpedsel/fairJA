set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 21.2928, <2> 21.464, <3> 26.8984, <4> 26.7091, <5> 33.6267, <6> 18.0598, <7> 32.6664, <8> 29.6446, <9> 17.8686, <10> 31.4094;
param workload[JOB] := <1> 453.3833, <2> 460.7033, <3> 723.5239, <4> 713.376, <5> 1130.755, <6> 326.1564, <7> 1067.0937, <8> 878.8023, <9> 319.2869, <10> 986.5504;
param capacity[MACHINE] := <1> 7059.6312, <2> 7059.6312, <3> 7059.6312;

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
