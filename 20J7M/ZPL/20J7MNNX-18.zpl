set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 25.994, <2> 29.1993, <3> 22.6747, <4> 26.2272, <5> 24.8963, <6> 26.4602, <7> 34.667, <8> 20.0274, <9> 28.4727, <10> 30.7047, <11> 15.0105, <12> 21.6189, <13> 26.631, <14> 22.6717, <15> 19.2403, <16> 21.1304, <17> 20.154, <18> 27.8266, <19> 25.765, <20> 29.8973;
param workload[JOB] := <1> 5.0984, <2> 5.4036, <3> 4.7618, <4> 5.1212, <5> 4.9896, <6> 5.1439, <7> 5.8879, <8> 4.4752, <9> 5.336, <10> 5.5412, <11> 3.8743, <12> 4.6496, <13> 5.1605, <14> 4.7615, <15> 4.3864, <16> 4.5968, <17> 4.4893, <18> 5.2751, <19> 5.0759, <20> 5.4678;
param capacity[MACHINE] := <1> 99.496, <2> 99.496, <3> 99.496, <4> 99.496, <5> 99.496, <6> 99.496, <7> 99.496;

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
