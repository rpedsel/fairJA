set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 32.4489, <2> 22.5879, <3> 28.6517, <4> 21.9871, <5> 26.5979, <6> 24.2322, <7> 18.4407, <8> 18.9254, <9> 21.4791, <10> 26.8154, <11> 17.3391, <12> 26.6691, <13> 26.408, <14> 20.877, <15> 27.9112, <16> 23.5665, <17> 20.5158, <18> 23.255, <19> 28.2085, <20> 29.4512;
param workload[JOB] := <1> 5.6964, <2> 4.7527, <3> 5.3527, <4> 4.689, <5> 5.1573, <6> 4.9226, <7> 4.2943, <8> 4.3503, <9> 4.6346, <10> 5.1784, <11> 4.164, <12> 5.1642, <13> 5.1389, <14> 4.5691, <15> 5.2831, <16> 4.8545, <17> 4.5294, <18> 4.8223, <19> 5.3112, <20> 5.4269;
param capacity[MACHINE] := <1> 12.2865, <2> 12.2865, <3> 12.2865, <4> 12.2865, <5> 12.2865, <6> 12.2865;

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
