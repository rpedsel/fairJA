set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 21.3544, <2> 25.4099, <3> 28.4481, <4> 19.5167, <5> 17.0967, <6> 33.7821, <7> 12.8849, <8> 25.4979, <9> 25.6363, <10> 26.0747, <11> 32.8996, <12> 24.346, <13> 20.6649, <14> 24.4778, <15> 20.708, <16> 24.7414, <17> 32.9201, <18> 30.8988, <19> 23.0404, <20> 26.825;
param workload[JOB] := <1> 4.6211, <2> 5.0408, <3> 5.3337, <4> 4.4178, <5> 4.1348, <6> 5.8122, <7> 3.5896, <8> 5.0495, <9> 5.0632, <10> 5.1063, <11> 5.7358, <12> 4.9342, <13> 4.5459, <14> 4.9475, <15> 4.5506, <16> 4.9741, <17> 5.7376, <18> 5.5587, <19> 4.8, <20> 5.1793;
param capacity[MACHINE] := <1> 99.1327, <2> 99.1327, <3> 99.1327, <4> 99.1327, <5> 99.1327, <6> 99.1327, <7> 99.1327;

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
