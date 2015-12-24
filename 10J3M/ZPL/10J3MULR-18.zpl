set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 30.9668, <2> 14.3862, <3> 35.5593, <4> 1.399, <5> 7.2863, <6> 13.4377, <7> 5.8609, <8> 45.2822, <9> 43.0503, <10> 27.3196;
param workload[JOB] := <1> 10.0876, <2> 4.0476, <3> 32.5446, <4> 8.4165, <5> 22.0666, <6> 23.6661, <7> 46.6451, <8> 48.0976, <9> 43.722, <10> 36.8269;
param capacity[MACHINE] := <1> 92.0402, <2> 92.0402, <3> 92.0402;

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
