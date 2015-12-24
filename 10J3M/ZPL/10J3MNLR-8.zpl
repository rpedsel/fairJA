set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 26.6882, <2> 30.7184, <3> 26.6781, <4> 25.7808, <5> 23.0037, <6> 26.8985, <7> 21.4376, <8> 26.2365, <9> 24.2411, <10> 26.1288;
param workload[JOB] := <1> 11.5113, <2> 1.0315, <3> 15.9498, <4> 6.8385, <5> 19.1133, <6> 48.693, <7> 4.4819, <8> 48.0623, <9> 49.3425, <10> 42.3302;
param capacity[MACHINE] := <1> 82.4514, <2> 82.4514, <3> 82.4514;

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
