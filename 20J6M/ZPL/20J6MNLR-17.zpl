set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 21.9765, <2> 26.6788, <3> 18.2768, <4> 23.6196, <5> 27.664, <6> 21.8636, <7> 24.6966, <8> 26.799, <9> 27.5729, <10> 34.6136, <11> 23.2199, <12> 27.8865, <13> 26.4376, <14> 24.9243, <15> 21.6943, <16> 14.2246, <17> 30.7985, <18> 25.4909, <19> 19.8548, <20> 33.0955;
param workload[JOB] := <1> 12.2033, <2> 11.4651, <3> 38.9111, <4> 40.565, <5> 20.3808, <6> 47.8395, <7> 46.4926, <8> 4.7537, <9> 12.3355, <10> 1.3823, <11> 25.1959, <12> 47.5021, <13> 21.9696, <14> 14.6036, <15> 40.1199, <16> 7.1666, <17> 38.454, <18> 21.4904, <19> 15.3226, <20> 26.3778;
param capacity[MACHINE] := <1> 82.4219, <2> 82.4219, <3> 82.4219, <4> 82.4219, <5> 82.4219, <6> 82.4219;

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
