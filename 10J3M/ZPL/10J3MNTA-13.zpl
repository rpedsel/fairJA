set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 18.6889, <2> 21.5004, <3> 23.4185, <4> 26.5759, <5> 29.9063, <6> 29.0417, <7> 27.1008, <8> 32.8319, <9> 27.5567, <10> 37.3179;
param workload[JOB] := <1> 349.275, <2> 462.2672, <3> 548.4261, <4> 706.2785, <5> 894.3868, <6> 843.4203, <7> 734.4534, <8> 1077.9337, <9> 759.3717, <10> 1392.6257;
param capacity[MACHINE] := <1> 1942.1096, <2> 1942.1096, <3> 1942.1096;

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
