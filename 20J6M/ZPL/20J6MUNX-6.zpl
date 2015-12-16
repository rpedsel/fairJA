set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 20.7364, <2> 18.0144, <3> 33.415, <4> 23.4095, <5> 13.5238, <6> 0.1136, <7> 16.2721, <8> 1.6278, <9> 19.1938, <10> 36.4797, <11> 1.2033, <12> 42.5914, <13> 34.4633, <14> 36.0904, <15> 4.8545, <16> 4.3982, <17> 17.5809, <18> 6.5701, <19> 45.5293, <20> 8.5117;
param workload[JOB] := <1> 4.5537, <2> 4.2443, <3> 5.7806, <4> 4.8383, <5> 3.6775, <6> 0.337, <7> 4.0339, <8> 1.2759, <9> 4.3811, <10> 6.0398, <11> 1.097, <12> 6.5262, <13> 5.8705, <14> 6.0075, <15> 2.2033, <16> 2.0972, <17> 4.193, <18> 2.5632, <19> 6.7475, <20> 2.9175;
param capacity[MACHINE] := <1> 79.385, <2> 79.385, <3> 79.385, <4> 79.385, <5> 79.385, <6> 79.385;

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
