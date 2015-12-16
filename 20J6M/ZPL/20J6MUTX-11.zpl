set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 40.6439, <2> 38.9775, <3> 44.6813, <4> 15.4348, <5> 35.4338, <6> 49.2993, <7> 36.8552, <8> 35.64, <9> 4.76, <10> 19.0946, <11> 19.6252, <12> 49.4216, <13> 44.582, <14> 34.4108, <15> 44.0205, <16> 14.7606, <17> 29.5927, <18> 48.9971, <19> 32.9429, <20> 36.105;
param workload[JOB] := <1> 6.3753, <2> 6.2432, <3> 6.6844, <4> 3.9287, <5> 5.9526, <6> 7.0213, <7> 6.0708, <8> 5.9699, <9> 2.1817, <10> 4.3697, <11> 4.43, <12> 7.03, <13> 6.677, <14> 5.8661, <15> 6.6348, <16> 3.842, <17> 5.4399, <18> 6.9998, <19> 5.7396, <20> 6.0087;
param capacity[MACHINE] := <1> 14.1832, <2> 14.1832, <3> 14.1832, <4> 14.1832, <5> 14.1832, <6> 14.1832;

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
