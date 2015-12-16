set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 32.0414, <2> 48.5983, <3> 6.7312, <4> 27.3444, <5> 45.412, <6> 2.2877, <7> 0.6176, <8> 27.1138, <9> 45.995, <10> 24.6212, <11> 34.2141, <12> 23.3276, <13> 39.5766, <14> 48.6789, <15> 39.2779, <16> 8.2439, <17> 34.9378, <18> 40.9597, <19> 5.241, <20> 45.302;
param workload[JOB] := <1> 5.6605, <2> 6.9712, <3> 2.5945, <4> 5.2292, <5> 6.7388, <6> 1.5125, <7> 0.7859, <8> 5.2071, <9> 6.782, <10> 4.962, <11> 5.8493, <12> 4.8299, <13> 6.291, <14> 6.977, <15> 6.2672, <16> 2.8712, <17> 5.9108, <18> 6.4, <19> 2.2893, <20> 6.7307;
param capacity[MACHINE] := <1> 100.8601, <2> 100.8601, <3> 100.8601, <4> 100.8601, <5> 100.8601, <6> 100.8601;

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
