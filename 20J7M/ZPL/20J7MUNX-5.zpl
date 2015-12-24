set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 6.1257, <2> 4.6271, <3> 47.4431, <4> 42.0957, <5> 43.9836, <6> 48.7686, <7> 32.1223, <8> 29.2682, <9> 0.5407, <10> 24.1898, <11> 26.7529, <12> 38.6387, <13> 41.5216, <14> 23.1435, <15> 35.8218, <16> 39.8138, <17> 0.51, <18> 47.8133, <19> 10.1548, <20> 0.8961;
param workload[JOB] := <1> 2.475, <2> 2.1511, <3> 6.8879, <4> 6.4881, <5> 6.632, <6> 6.9835, <7> 5.6677, <8> 5.41, <9> 0.7353, <10> 4.9183, <11> 5.1723, <12> 6.216, <13> 6.4437, <14> 4.8108, <15> 5.9851, <16> 6.3098, <17> 0.7141, <18> 6.9147, <19> 3.1867, <20> 0.9466;
param capacity[MACHINE] := <1> 95.0487, <2> 95.0487, <3> 95.0487, <4> 95.0487, <5> 95.0487, <6> 95.0487, <7> 95.0487;

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
