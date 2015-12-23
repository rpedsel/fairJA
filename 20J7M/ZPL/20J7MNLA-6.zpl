set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 32.0158, <2> 30.5617, <3> 22.956, <4> 20.7838, <5> 25.2512, <6> 27.1714, <7> 20.8273, <8> 23.3094, <9> 30.2075, <10> 22.383, <11> 28.9528, <12> 27.6483, <13> 25.543, <14> 24.6272, <15> 31.2826, <16> 26.4405, <17> 23.3874, <18> 21.3639, <19> 21.6648, <20> 29.4951;
param workload[JOB] := <1> 1025.0114, <2> 934.0175, <3> 526.9779, <4> 431.9663, <5> 637.6231, <6> 738.285, <7> 433.7764, <8> 543.3281, <9> 912.4931, <10> 500.9987, <11> 838.2646, <12> 764.4285, <13> 652.4448, <14> 606.499, <15> 978.6011, <16> 699.1, <17> 546.9705, <18> 456.4162, <19> 469.3636, <20> 869.9609;
param capacity[MACHINE] := <1> 1938.0752, <2> 1938.0752, <3> 1938.0752, <4> 1938.0752, <5> 1938.0752, <6> 1938.0752, <7> 1938.0752;

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