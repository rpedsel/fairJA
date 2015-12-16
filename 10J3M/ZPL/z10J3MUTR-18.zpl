set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 34.7385, <2> 48.2997, <3> 41.6666, <4> 34.3753, <5> 40.0453, <6> 38.6342, <7> 15.3865, <8> 45.4266, <9> 5.1561, <10> 31.7299;
param workload[JOB] := <1> 19.5043, <2> 28.9263, <3> 34.8857, <4> 40.9784, <5> 47.1506, <6> 46.0696, <7> 0.839, <8> 40.0512, <9> 27.1778, <10> 43.7679;
param capacity[MACHINE] := <1> 82.3377, <2> 82.3377, <3> 82.3377;

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
