set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 27.5982, <2> 19.8146, <3> 38.3137, <4> 35.6939, <5> 21.3431, <6> 26.6396, <7> 18.5577, <8> 23.9519, <9> 20.9409, <10> 25.8957, <11> 25.6097, <12> 30.318, <13> 17.4163, <14> 24.3801, <15> 23.247, <16> 19.449, <17> 19.4814, <18> 23.4599, <19> 35.1717, <20> 25.4192;
param workload[JOB] := <1> 5.2534, <2> 4.4514, <3> 6.1898, <4> 5.9744, <5> 4.6199, <6> 5.1614, <7> 4.3079, <8> 4.8941, <9> 4.5761, <10> 5.0888, <11> 5.0606, <12> 5.5062, <13> 4.1733, <14> 4.9376, <15> 4.8215, <16> 4.4101, <17> 4.4138, <18> 4.8435, <19> 5.9306, <20> 5.0417;
param capacity[MACHINE] := <1> 14.2366, <2> 14.2366, <3> 14.2366, <4> 14.2366, <5> 14.2366, <6> 14.2366, <7> 14.2366;

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
