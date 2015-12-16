set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 23.9362, <2> 20.4489, <3> 17.5196, <4> 23.9021, <5> 19.7293, <6> 25.854, <7> 33.4393, <8> 28.6311, <9> 28.9536, <10> 28.9522, <11> 29.4086, <12> 28.6143, <13> 25.307, <14> 27.036, <15> 21.7468, <16> 20.9066, <17> 27.461, <18> 21.6853, <19> 26.7407, <20> 22.3772;
param workload[JOB] := <1> 48.5963, <2> 14.7888, <3> 46.3919, <4> 15.1948, <5> 2.3756, <6> 1.4738, <7> 21.4748, <8> 0.5936, <9> 5.8042, <10> 4.5347, <11> 45.3965, <12> 41.5258, <13> 31.7681, <14> 29.185, <15> 23.936, <16> 45.9955, <17> 28.3387, <18> 20.566, <19> 17.3733, <20> 46.6007;
param capacity[MACHINE] := <1> 61.4893, <2> 61.4893, <3> 61.4893, <4> 61.4893, <5> 61.4893, <6> 61.4893;

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
