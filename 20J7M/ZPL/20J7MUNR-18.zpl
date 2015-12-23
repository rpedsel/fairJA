set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 30.2717, <2> 21.59, <3> 17.688, <4> 17.7243, <5> 20.0089, <6> 6.5038, <7> 26.2526, <8> 48.5669, <9> 15.4101, <10> 49.1867, <11> 21.2629, <12> 19.4491, <13> 0.5321, <14> 29.7893, <15> 4.7313, <16> 41.5085, <17> 43.1922, <18> 0.1396, <19> 29.8407, <20> 25.0071;
param workload[JOB] := <1> 32.7006, <2> 2.2978, <3> 37.1769, <4> 33.9259, <5> 47.8697, <6> 19.5802, <7> 20.141, <8> 8.8827, <9> 28.1238, <10> 29.1502, <11> 24.118, <12> 36.6159, <13> 15.4806, <14> 12.9727, <15> 24.7646, <16> 36.7247, <17> 28.217, <18> 34.2756, <19> 36.8005, <20> 28.7012;
param capacity[MACHINE] := <1> 538.5196, <2> 538.5196, <3> 538.5196, <4> 538.5196, <5> 538.5196, <6> 538.5196, <7> 538.5196;

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
