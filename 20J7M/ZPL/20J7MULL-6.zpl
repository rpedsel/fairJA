set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 7.3342, <2> 5.4444, <3> 28.7614, <4> 5.6135, <5> 7.1618, <6> 13.1708, <7> 28.1155, <8> 12.0254, <9> 6.889, <10> 7.1093, <11> 35.4751, <12> 34.9062, <13> 33.1568, <14> 6.9069, <15> 3.9831, <16> 12.1071, <17> 15.3032, <18> 34.255, <19> 34.1309, <20> 17.7651;
param workload[JOB] := <1> 7.3342, <2> 5.4444, <3> 28.7614, <4> 5.6135, <5> 7.1618, <6> 13.1708, <7> 28.1155, <8> 12.0254, <9> 6.889, <10> 7.1093, <11> 35.4751, <12> 34.9062, <13> 33.1568, <14> 6.9069, <15> 3.9831, <16> 12.1071, <17> 15.3032, <18> 34.255, <19> 34.1309, <20> 17.7651;
param capacity[MACHINE] := <1> 49.945, <2> 49.945, <3> 49.945, <4> 49.945, <5> 49.945, <6> 49.945, <7> 49.945;

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
