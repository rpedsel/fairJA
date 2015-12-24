set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 21.1547, <2> 31.8723, <3> 19.2452, <4> 32.9904, <5> 29.3738, <6> 20.0945, <7> 35.1451, <8> 20.9608, <9> 21.426, <10> 30.5342;
param workload[JOB] := <1> 447.5213, <2> 1015.8435, <3> 370.3777, <4> 1088.3665, <5> 862.8201, <6> 403.7889, <7> 1235.1781, <8> 439.3551, <9> 459.0735, <10> 932.3374;
param capacity[MACHINE] := <1> 1813.6655, <2> 1813.6655, <3> 1813.6655;

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
