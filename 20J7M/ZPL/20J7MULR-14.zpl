set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 28.8529, <2> 40.3518, <3> 9.6347, <4> 16.3657, <5> 42.2844, <6> 49.8694, <7> 33.28, <8> 21.2219, <9> 20.3858, <10> 45.9403, <11> 21.3728, <12> 38.0901, <13> 49.9252, <14> 18.641, <15> 30.5663, <16> 32.7792, <17> 24.4462, <18> 19.8404, <19> 30.6259, <20> 38.8527;
param workload[JOB] := <1> 40.7732, <2> 46.5801, <3> 26.0211, <4> 39.0274, <5> 37.5415, <6> 23.1554, <7> 17.8227, <8> 17.2868, <9> 18.8246, <10> 39.3527, <11> 9.5669, <12> 24.9156, <13> 47.1504, <14> 19.7789, <15> 34.6848, <16> 3.9329, <17> 35.0927, <18> 32.6425, <19> 20.3738, <20> 24.8755;
param capacity[MACHINE] := <1> 79.9142, <2> 79.9142, <3> 79.9142, <4> 79.9142, <5> 79.9142, <6> 79.9142, <7> 79.9142;

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
