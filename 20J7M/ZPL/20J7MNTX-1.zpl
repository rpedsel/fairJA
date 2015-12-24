set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 27.905, <2> 20.0604, <3> 23.5271, <4> 25.9993, <5> 23.8873, <6> 33.457, <7> 23.6519, <8> 27.411, <9> 21.6142, <10> 30.3515, <11> 22.6304, <12> 22.2588, <13> 26.7578, <14> 21.3156, <15> 23.5734, <16> 32.3963, <17> 25.1803, <18> 21.7745, <19> 19.635, <20> 25.7647;
param workload[JOB] := <1> 5.2825, <2> 4.4789, <3> 4.8505, <4> 5.099, <5> 4.8875, <6> 5.7842, <7> 4.8633, <8> 5.2356, <9> 4.6491, <10> 5.5092, <11> 4.7571, <12> 4.7179, <13> 5.1728, <14> 4.6169, <15> 4.8552, <16> 5.6918, <17> 5.018, <18> 4.6663, <19> 4.4311, <20> 5.0759;
param capacity[MACHINE] := <1> 10.676, <2> 10.676, <3> 10.676, <4> 10.676, <5> 10.676, <6> 10.676, <7> 10.676;

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
