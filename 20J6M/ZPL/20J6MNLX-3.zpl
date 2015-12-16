set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 30.7398, <2> 20.5352, <3> 30.3546, <4> 24.159, <5> 25.7039, <6> 25.6449, <7> 26.9907, <8> 26.9948, <9> 28.2491, <10> 22.9382, <11> 29.0675, <12> 17.5694, <13> 22.3742, <14> 24.1001, <15> 14.3594, <16> 18.5038, <17> 20.6262, <18> 26.765, <19> 26.5876, <20> 28.705;
param workload[JOB] := <1> 5.5443, <2> 4.5316, <3> 5.5095, <4> 4.9152, <5> 5.0699, <6> 5.0641, <7> 5.1953, <8> 5.1957, <9> 5.315, <10> 4.7894, <11> 5.3914, <12> 4.1916, <13> 4.7301, <14> 4.9092, <15> 3.7894, <16> 4.3016, <17> 4.5416, <18> 5.1735, <19> 5.1563, <20> 5.3577;
param capacity[MACHINE] := <1> 16.4454, <2> 16.4454, <3> 16.4454, <4> 16.4454, <5> 16.4454, <6> 16.4454;

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
