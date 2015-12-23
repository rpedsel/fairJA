set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 25.6005, <2> 35.556, <3> 20.8568, <4> 28.9959, <5> 28.5273, <6> 22.722, <7> 26.6904, <8> 16.6563, <9> 22.749, <10> 30.4538, <11> 24.3925, <12> 26.9922, <13> 20.5179, <14> 26.7849, <15> 26.316, <16> 27.2667, <17> 27.9701, <18> 16.7684, <19> 26.9635, <20> 23.477;
param workload[JOB] := <1> 5.0597, <2> 5.9629, <3> 4.5669, <4> 5.3848, <5> 5.3411, <6> 4.7668, <7> 5.1663, <8> 4.0812, <9> 4.7696, <10> 5.5185, <11> 4.9389, <12> 5.1954, <13> 4.5297, <14> 5.1754, <15> 5.1299, <16> 5.2218, <17> 5.2887, <18> 4.0949, <19> 5.1926, <20> 4.8453;
param capacity[MACHINE] := <1> 10.7389, <2> 10.7389, <3> 10.7389, <4> 10.7389, <5> 10.7389, <6> 10.7389, <7> 10.7389;

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
