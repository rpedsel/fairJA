set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 30.101, <2> 30.1308, <3> 25.8801, <4> 23.3463, <5> 24.765, <6> 29.1935, <7> 20.8513, <8> 23.9809, <9> 26.2241, <10> 22.5377, <11> 32.7785, <12> 31.2201, <13> 22.4926, <14> 23.32, <15> 21.5, <16> 24.6373, <17> 28.1302, <18> 26.3128, <19> 27.1382, <20> 23.2851;
param workload[JOB] := <1> 30.101, <2> 30.1308, <3> 25.8801, <4> 23.3463, <5> 24.765, <6> 29.1935, <7> 20.8513, <8> 23.9809, <9> 26.2241, <10> 22.5377, <11> 32.7785, <12> 31.2201, <13> 22.4926, <14> 23.32, <15> 21.5, <16> 24.6373, <17> 28.1302, <18> 26.3128, <19> 27.1382, <20> 23.2851;
param capacity[MACHINE] := <1> 73.9751, <2> 73.9751, <3> 73.9751, <4> 73.9751, <5> 73.9751, <6> 73.9751, <7> 73.9751;

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
