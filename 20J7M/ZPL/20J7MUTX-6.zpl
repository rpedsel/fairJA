set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 5.6014, <2> 32.5133, <3> 22.2224, <4> 49.7945, <5> 38.5526, <6> 9.4523, <7> 32.2673, <8> 14.06, <9> 7.3116, <10> 20.7881, <11> 10.4419, <12> 46.9695, <13> 19.7511, <14> 40.9228, <15> 45.5099, <16> 23.4977, <17> 30.7249, <18> 10.6398, <19> 39.5569, <20> 15.8682;
param workload[JOB] := <1> 2.3667, <2> 5.702, <3> 4.7141, <4> 7.0565, <5> 6.2091, <6> 3.0745, <7> 5.6804, <8> 3.7497, <9> 2.704, <10> 4.5594, <11> 3.2314, <12> 6.8534, <13> 4.4442, <14> 6.3971, <15> 6.7461, <16> 4.8474, <17> 5.543, <18> 3.2619, <19> 6.2894, <20> 3.9835;
param capacity[MACHINE] := <1> 10.4372, <2> 10.4372, <3> 10.4372, <4> 10.4372, <5> 10.4372, <6> 10.4372, <7> 10.4372;

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
