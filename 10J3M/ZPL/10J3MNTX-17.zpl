set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 26.3136, <2> 25.9751, <3> 20.0893, <4> 21.2457, <5> 29.229, <6> 28.323, <7> 19.2411, <8> 18.7376, <9> 26.2682, <10> 26.6043;
param workload[JOB] := <1> 5.1297, <2> 5.0966, <3> 4.4821, <4> 4.6093, <5> 5.4064, <6> 5.3219, <7> 4.3865, <8> 4.3287, <9> 5.1253, <10> 5.1579;
param capacity[MACHINE] := <1> 12.2611, <2> 12.2611, <3> 12.2611;

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
