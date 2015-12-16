set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 19.8132, <2> 27.2889, <3> 22.515, <4> 31.9649, <5> 29.9655, <6> 35.6673, <7> 23.6883, <8> 28.7158, <9> 21.8822, <10> 27.4099, <11> 25.4221, <12> 28.4012, <13> 28.5869, <14> 25.1999, <15> 31.4824, <16> 29.5948, <17> 22.5666, <18> 24.6598, <19> 25.6402, <20> 33.8714;
param workload[JOB] := <1> 4.4512, <2> 5.2239, <3> 4.745, <4> 5.6538, <5> 5.4741, <6> 5.9722, <7> 4.8671, <8> 5.3587, <9> 4.6778, <10> 5.2354, <11> 5.042, <12> 5.3293, <13> 5.3467, <14> 5.02, <15> 5.6109, <16> 5.4401, <17> 4.7504, <18> 4.9659, <19> 5.0636, <20> 5.8199;
param capacity[MACHINE] := <1> 104.048, <2> 104.048, <3> 104.048, <4> 104.048, <5> 104.048, <6> 104.048;

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
