set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 19.3813, <2> 20.3052, <3> 31.4582, <4> 26.2406, <5> 22.4593, <6> 26.0448, <7> 19.2335, <8> 29.5627, <9> 19.3141, <10> 25.0876, <11> 32.3699, <12> 28.9267, <13> 19.8621, <14> 22.4025, <15> 26.5881, <16> 14.2287, <17> 33.0246, <18> 27.0065, <19> 24.5136, <20> 26.2209;
param workload[JOB] := <1> 19.6024, <2> 7.9049, <3> 1.2058, <4> 19.2719, <5> 32.4156, <6> 14.6661, <7> 12.0619, <8> 42.3243, <9> 37.2833, <10> 11.2889, <11> 49.0769, <12> 6.3199, <13> 5.1088, <14> 35.4934, <15> 19.6732, <16> 41.7262, <17> 32.5981, <18> 34.5184, <19> 21.6861, <20> 35.7621;
param capacity[MACHINE] := <1> 51.4273, <2> 51.4273, <3> 51.4273, <4> 51.4273, <5> 51.4273, <6> 51.4273, <7> 51.4273;

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
