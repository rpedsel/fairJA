set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 46.5244, <2> 3.0424, <3> 11.3206, <4> 23.1702, <5> 33.6865, <6> 29.8955, <7> 8.838, <8> 15.1482, <9> 12.1129, <10> 11.6625, <11> 3.841, <12> 20.3785, <13> 49.0592, <14> 45.9149, <15> 32.6424, <16> 9.3337, <17> 34.1818, <18> 26.9323, <19> 46.955, <20> 9.6419;
param workload[JOB] := <1> 6.8209, <2> 1.7442, <3> 3.3646, <4> 4.8135, <5> 5.804, <6> 5.4677, <7> 2.9729, <8> 3.8921, <9> 3.4804, <10> 3.415, <11> 1.9598, <12> 4.5143, <13> 7.0042, <14> 6.7761, <15> 5.7134, <16> 3.0551, <17> 5.8465, <18> 5.1896, <19> 6.8524, <20> 3.1051;
param capacity[MACHINE] := <1> 13.1131, <2> 13.1131, <3> 13.1131, <4> 13.1131, <5> 13.1131, <6> 13.1131, <7> 13.1131;

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
