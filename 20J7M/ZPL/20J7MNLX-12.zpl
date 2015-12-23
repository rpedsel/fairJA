set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 24.9883, <2> 24.3837, <3> 20.5159, <4> 27.8189, <5> 22.5566, <6> 24.0474, <7> 23.3163, <8> 27.3443, <9> 31.3355, <10> 31.7965, <11> 26.9254, <12> 27.367, <13> 29.0875, <14> 25.6698, <15> 26.5545, <16> 30.2534, <17> 29.0112, <18> 31.1062, <19> 27.923, <20> 27.3822;
param workload[JOB] := <1> 4.9988, <2> 4.938, <3> 4.5294, <4> 5.2744, <5> 4.7494, <6> 4.9038, <7> 4.8287, <8> 5.2292, <9> 5.5978, <10> 5.6388, <11> 5.189, <12> 5.2313, <13> 5.3933, <14> 5.0665, <15> 5.1531, <16> 5.5003, <17> 5.3862, <18> 5.5773, <19> 5.2842, <20> 5.2328;
param capacity[MACHINE] := <1> 14.8146, <2> 14.8146, <3> 14.8146, <4> 14.8146, <5> 14.8146, <6> 14.8146, <7> 14.8146;

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
