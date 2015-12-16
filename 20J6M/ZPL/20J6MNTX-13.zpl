set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 29.4124, <2> 26.4136, <3> 22.8188, <4> 25.5956, <5> 28.5428, <6> 33.5955, <7> 27.2506, <8> 20.8393, <9> 23.4084, <10> 27.0913, <11> 22.6628, <12> 22.9905, <13> 27.991, <14> 16.4296, <15> 22.9564, <16> 35.1408, <17> 23.2692, <18> 30.9284, <19> 28.4247, <20> 27.1956;
param workload[JOB] := <1> 5.4233, <2> 5.1394, <3> 4.7769, <4> 5.0592, <5> 5.3425, <6> 5.7962, <7> 5.2202, <8> 4.565, <9> 4.8382, <10> 5.2049, <11> 4.7605, <12> 4.7948, <13> 5.2907, <14> 4.0533, <15> 4.7913, <16> 5.928, <17> 4.8238, <18> 5.5613, <19> 5.3315, <20> 5.2149;
param capacity[MACHINE] := <1> 12.7395, <2> 12.7395, <3> 12.7395, <4> 12.7395, <5> 12.7395, <6> 12.7395;

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
