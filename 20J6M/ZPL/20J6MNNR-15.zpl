set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 32.1531, <2> 28.3502, <3> 26.8016, <4> 24.8078, <5> 24.9293, <6> 30.729, <7> 23.2376, <8> 22.2218, <9> 18.7213, <10> 34.6408, <11> 28.0955, <12> 33.2701, <13> 25.1195, <14> 33.2328, <15> 20.5938, <16> 29.8882, <17> 22.1672, <18> 27.8635, <19> 20.4319, <20> 25.3633;
param workload[JOB] := <1> 45.7922, <2> 5.7009, <3> 39.0126, <4> 27.5885, <5> 24.8191, <6> 7.0206, <7> 22.7706, <8> 47.0532, <9> 21.4689, <10> 45.0281, <11> 44.4978, <12> 18.0946, <13> 21.7445, <14> 16.9507, <15> 2.8375, <16> 44.1206, <17> 46.8518, <18> 0.8462, <19> 48.8869, <20> 34.5128;
param capacity[MACHINE] := <1> 565.5981, <2> 565.5981, <3> 565.5981, <4> 565.5981, <5> 565.5981, <6> 565.5981;

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
