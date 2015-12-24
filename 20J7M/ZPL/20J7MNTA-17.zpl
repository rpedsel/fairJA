set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 27.9888, <2> 23.7156, <3> 32.7213, <4> 32.567, <5> 28.3083, <6> 30.7234, <7> 27.4172, <8> 21.5007, <9> 27.863, <10> 24.1664, <11> 32.8402, <12> 24.4185, <13> 31.8341, <14> 24.4738, <15> 17.9578, <16> 22.4398, <17> 23.0824, <18> 20.8955, <19> 23.8176, <20> 27.3987;
param workload[JOB] := <1> 783.3729, <2> 562.4297, <3> 1070.6835, <4> 1060.6095, <5> 801.3598, <6> 943.9273, <7> 751.7029, <8> 462.2801, <9> 776.3468, <10> 584.0149, <11> 1078.4787, <12> 596.2631, <13> 1013.4099, <14> 598.9669, <15> 322.4826, <16> 503.5446, <17> 532.7972, <18> 436.6219, <19> 567.2781, <20> 750.6888;
param capacity[MACHINE] := <1> 1521.1349, <2> 1521.1349, <3> 1521.1349, <4> 1521.1349, <5> 1521.1349, <6> 1521.1349, <7> 1521.1349;

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
