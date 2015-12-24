set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 38.8359, <2> 22.2062, <3> 29.1123, <4> 20.5515, <5> 44.8508, <6> 34.0471, <7> 26.8613, <8> 36.2973, <9> 49.4845, <10> 23.3386, <11> 48.5089, <12> 34.1935, <13> 32.5026, <14> 15.7672, <15> 33.7679, <16> 19.5236, <17> 6.8024, <18> 40.5383, <19> 46.1565, <20> 36.6811;
param workload[JOB] := <1> 6.2318, <2> 4.7123, <3> 5.3956, <4> 4.5334, <5> 6.6971, <6> 5.835, <7> 5.1828, <8> 6.0247, <9> 7.0345, <10> 4.831, <11> 6.9648, <12> 5.8475, <13> 5.7011, <14> 3.9708, <15> 5.811, <16> 4.4186, <17> 2.6081, <18> 6.367, <19> 6.7939, <20> 6.0565;
param capacity[MACHINE] := <1> 15.8596, <2> 15.8596, <3> 15.8596, <4> 15.8596, <5> 15.8596, <6> 15.8596, <7> 15.8596;

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
