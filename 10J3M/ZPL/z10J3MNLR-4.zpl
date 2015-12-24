set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 21.6413, <2> 26.0603, <3> 29.7831, <4> 27.5445, <5> 22.5016, <6> 22.2186, <7> 18.1542, <8> 19.5821, <9> 21.3609, <10> 20.7981;
param workload[JOB] := <1> 8.5289, <2> 17.2753, <3> 41.9683, <4> 49.7288, <5> 8.3952, <6> 24.7883, <7> 45.6149, <8> 22.7778, <9> 27.7377, <10> 33.4677;
param capacity[MACHINE] := <1> 93.4276, <2> 93.4276, <3> 93.4276;

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
