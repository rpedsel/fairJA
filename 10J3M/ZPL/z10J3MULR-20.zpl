set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 2.2174, <2> 1.4921, <3> 12.2329, <4> 8.8068, <5> 29.258, <6> 46.4741, <7> 25.6878, <8> 17.2699, <9> 18.168, <10> 31.7547;
param workload[JOB] := <1> 43.6271, <2> 3.9043, <3> 13.1411, <4> 20.8093, <5> 47.9365, <6> 2.3274, <7> 15.0304, <8> 16.8783, <9> 5.4781, <10> 19.4094;
param capacity[MACHINE] := <1> 62.8473, <2> 62.8473, <3> 62.8473;

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
