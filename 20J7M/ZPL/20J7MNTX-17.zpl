set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 31.3313, <2> 23.8605, <3> 25.0918, <4> 28.9354, <5> 25.5486, <6> 24.9573, <7> 19.6394, <8> 27.2856, <9> 13.0146, <10> 27.3751, <11> 24.3397, <12> 16.6782, <13> 20.5151, <14> 20.6077, <15> 33.8848, <16> 24.4011, <17> 33.5448, <18> 15.1099, <19> 18.5912, <20> 34.425;
param workload[JOB] := <1> 5.5974, <2> 4.8847, <3> 5.0092, <4> 5.3792, <5> 5.0546, <6> 4.9957, <7> 4.4316, <8> 5.2236, <9> 3.6076, <10> 5.2321, <11> 4.9335, <12> 4.0839, <13> 4.5294, <14> 4.5396, <15> 5.8211, <16> 4.9397, <17> 5.7918, <18> 3.8871, <19> 4.3118, <20> 5.8673;
param capacity[MACHINE] := <1> 10.513, <2> 10.513, <3> 10.513, <4> 10.513, <5> 10.513, <6> 10.513, <7> 10.513;

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
