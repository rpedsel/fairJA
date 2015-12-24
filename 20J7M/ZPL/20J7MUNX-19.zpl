set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 41.4383, <2> 9.7886, <3> 23.9021, <4> 45.8624, <5> 35.3007, <6> 13.1923, <7> 36.084, <8> 49.5475, <9> 13.9856, <10> 30.1833, <11> 12.3126, <12> 22.0385, <13> 6.1322, <14> 10.2031, <15> 3.5265, <16> 2.7098, <17> 41.871, <18> 20.6499, <19> 40.7953, <20> 0.382;
param workload[JOB] := <1> 6.4373, <2> 3.1287, <3> 4.889, <4> 6.7722, <5> 5.9414, <6> 3.6321, <7> 6.007, <8> 7.039, <9> 3.7397, <10> 5.4939, <11> 3.5089, <12> 4.6945, <13> 2.4763, <14> 3.1942, <15> 1.8779, <16> 1.6461, <17> 6.4708, <18> 4.5442, <19> 6.3871, <20> 0.6181;
param capacity[MACHINE] := <1> 88.4984, <2> 88.4984, <3> 88.4984, <4> 88.4984, <5> 88.4984, <6> 88.4984, <7> 88.4984;

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
