set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 23.307, <2> 24.9696, <3> 31.5267, <4> 20.0863, <5> 24.7961, <6> 31.2264, <7> 21.5576, <8> 31.5829, <9> 29.1151, <10> 28.5281, <11> 30.6006, <12> 30.6823, <13> 22.8121, <14> 33.8564, <15> 32.0233, <16> 32.944, <17> 20.4426, <18> 37.7213, <19> 25.0761, <20> 17.0501;
param workload[JOB] := <1> 4.8277, <2> 4.997, <3> 5.6149, <4> 4.4818, <5> 4.9796, <6> 5.5881, <7> 4.643, <8> 5.6199, <9> 5.3958, <10> 5.3412, <11> 5.5318, <12> 5.5392, <13> 4.7762, <14> 5.8186, <15> 5.6589, <16> 5.7397, <17> 4.5213, <18> 6.1418, <19> 5.0076, <20> 4.1292;
param capacity[MACHINE] := <1> 14.9076, <2> 14.9076, <3> 14.9076, <4> 14.9076, <5> 14.9076, <6> 14.9076, <7> 14.9076;

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
