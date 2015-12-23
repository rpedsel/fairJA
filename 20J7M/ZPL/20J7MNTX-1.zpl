set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 20.7444, <2> 28.0954, <3> 15.3954, <4> 26.2714, <5> 21.2957, <6> 32.9938, <7> 20.8427, <8> 28.3961, <9> 22.8331, <10> 26.3255, <11> 21.3714, <12> 20.9668, <13> 31.7448, <14> 15.3536, <15> 24.8881, <16> 15.816, <17> 24.2769, <18> 24.2059, <19> 26.3493, <20> 35.0011;
param workload[JOB] := <1> 4.5546, <2> 5.3005, <3> 3.9237, <4> 5.1256, <5> 4.6147, <6> 5.744, <7> 4.5654, <8> 5.3288, <9> 4.7784, <10> 5.1308, <11> 4.6229, <12> 4.579, <13> 5.6343, <14> 3.9184, <15> 4.9888, <16> 3.9769, <17> 4.9272, <18> 4.9199, <19> 5.1332, <20> 5.9162;
param capacity[MACHINE] := <1> 10.4661, <2> 10.4661, <3> 10.4661, <4> 10.4661, <5> 10.4661, <6> 10.4661, <7> 10.4661;

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
