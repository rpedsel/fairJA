set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 19.192, <2> 1.3633, <3> 43.8154, <4> 23.627, <5> 41.4398, <6> 13.7332, <7> 46.2501, <8> 37.972, <9> 26.9028, <10> 6.3372, <11> 11.675, <12> 42.8181, <13> 33.9628, <14> 7.9052, <15> 40.3634, <16> 6.3584, <17> 31.4437, <18> 44.0345, <19> 45.5224, <20> 9.1712;
param workload[JOB] := <1> 1.3338, <2> 49.1234, <3> 32.7574, <4> 12.7474, <5> 2.9523, <6> 5.8764, <7> 30.9445, <8> 41.5891, <9> 44.4618, <10> 41.5123, <11> 25.8842, <12> 28.1309, <13> 28.0292, <14> 39.5358, <15> 24.7174, <16> 37.0524, <17> 9.2202, <18> 18.8304, <19> 44.4159, <20> 47.7064;
param capacity[MACHINE] := <1> 566.8212, <2> 566.8212, <3> 566.8212, <4> 566.8212, <5> 566.8212, <6> 566.8212;

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
