set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 18.1908, <2> 11.5346, <3> 5.053, <4> 26.6281, <5> 47.8972, <6> 14.8272, <7> 31.9641, <8> 11.9512, <9> 6.8411, <10> 13.9949, <11> 42.3534, <12> 29.4374, <13> 42.6792, <14> 31.8216, <15> 15.3977, <16> 27.4669, <17> 21.9596, <18> 9.6471, <19> 24.7942, <20> 9.0376;
param workload[JOB] := <1> 330.9052, <2> 133.047, <3> 25.5328, <4> 709.0557, <5> 2294.1418, <6> 219.8459, <7> 1021.7037, <8> 142.8312, <9> 46.8006, <10> 195.8572, <11> 1793.8105, <12> 866.5605, <13> 1821.5141, <14> 1012.6142, <15> 237.0892, <16> 754.4306, <17> 482.224, <18> 93.0665, <19> 614.7524, <20> 81.6782;
param capacity[MACHINE] := <1> 12877.4613, <2> 12877.4613, <3> 12877.4613, <4> 12877.4613, <5> 12877.4613, <6> 12877.4613, <7> 12877.4613;

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
