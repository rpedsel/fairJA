set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 26.7244, <2> 23.9001, <3> 18.6617, <4> 12.3982, <5> 27.9452, <6> 22.1225, <7> 41.4072, <8> 28.3308, <9> 43.6064, <10> 47.1314, <11> 7.6101, <12> 0.6045, <13> 31.2794, <14> 2.8466, <15> 30.7743, <16> 17.1037, <17> 43.9302, <18> 43.2474, <19> 5.7737, <20> 35.9293;
param workload[JOB] := <1> 26.1461, <2> 19.3876, <3> 13.0137, <4> 20.9239, <5> 10.779, <6> 4.3618, <7> 33.9169, <8> 47.6389, <9> 18.283, <10> 29.5687, <11> 6.5252, <12> 13.4867, <13> 28.0785, <14> 18.552, <15> 17.3335, <16> 32.2567, <17> 0.974, <18> 45.3484, <19> 44.5843, <20> 36.3127;
param capacity[MACHINE] := <1> 50.0863, <2> 50.0863, <3> 50.0863, <4> 50.0863, <5> 50.0863, <6> 50.0863, <7> 50.0863;

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
