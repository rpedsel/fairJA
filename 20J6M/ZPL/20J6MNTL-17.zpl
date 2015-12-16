set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 28.8291, <2> 25.0373, <3> 21.7807, <4> 28.0002, <5> 25.6893, <6> 29.5496, <7> 28.9471, <8> 20.0888, <9> 18.1443, <10> 24.8454, <11> 20.5802, <12> 20.154, <13> 19.4708, <14> 29.9909, <15> 28.0405, <16> 25.4952, <17> 28.8436, <18> 17.8816, <19> 24.7157, <20> 27.1105;
param workload[JOB] := <1> 28.8291, <2> 25.0373, <3> 21.7807, <4> 28.0002, <5> 25.6893, <6> 29.5496, <7> 28.9471, <8> 20.0888, <9> 18.1443, <10> 24.8454, <11> 20.5802, <12> 20.154, <13> 19.4708, <14> 29.9909, <15> 28.0405, <16> 25.4952, <17> 28.8436, <18> 17.8816, <19> 24.7157, <20> 27.1105;
param capacity[MACHINE] := <1> 61.6493, <2> 61.6493, <3> 61.6493, <4> 61.6493, <5> 61.6493, <6> 61.6493;

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
